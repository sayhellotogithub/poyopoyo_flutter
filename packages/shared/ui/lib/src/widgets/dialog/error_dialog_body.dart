// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/09
// Description:
// -------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui/l10n/ui_localizations.dart';

import 'dialog_skin.dart';
import 'dialog_texts.dart';

class ErrorDialogBody extends StatefulWidget {
  final String message;
  final VoidCallback? onRetry;
  final Map<String, String>? details;
  final DialogSkin skin;
  final DialogTexts texts;

  const ErrorDialogBody({
    super.key,
    required this.message,
    this.onRetry,
    this.details,
    required this.skin,
    required this.texts,
  });

  @override
  State<ErrorDialogBody> createState() => _ErrorDialogBodyState();
}

class _ErrorDialogBodyState extends State<ErrorDialogBody>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late final AnimationController _animationController;
  late final Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: widget.skin.shape,
      title: Text(widget.texts.title),
      contentPadding: widget.skin.contentPadding,
      actionsPadding: widget.skin.actionsPadding,
      content: _buildContent(context),
      actions: _buildActions(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SelectableText(
          widget.message,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        if (_hasDetails) ...[
          const SizedBox(height: 12),
          _buildExpandToggle(),
          _buildExpandableDetails(context),
        ],
      ],
    );
  }

  Widget _buildExpandToggle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton.icon(
        onPressed: _toggleExpanded,
        icon: AnimatedRotation(
          turns: _isExpanded ? 0.5 : 0,
          duration: const Duration(milliseconds: 200),
          child: const Icon(Icons.expand_more),
        ),
        label: Text(
          _isExpanded ? widget.texts.hideDetails : widget.texts.showDetails,
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
    );
  }

  Widget _buildExpandableDetails(BuildContext context) {
    return SizeTransition(
      sizeFactor: _expandAnimation,
      child: FadeTransition(
        opacity: _expandAnimation,
        child: _buildDetailsBox(context),
      ),
    );
  }

  Widget _buildDetailsBox(BuildContext context) {
    if (!_hasDetails) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: widget.details!.entries
            .map((entry) => _buildDetailItem(context, entry.key, entry.value))
            .toList(),
      ),
    );
  }

  Widget _buildDetailItem(BuildContext context, String key, String value) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              key,
              style: theme.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SelectableText(
              value,
              style: theme.textTheme.bodySmall?.copyWith(
                fontFamily: 'monospace',
              ),
            ),
          ),
          const SizedBox(width: 8),
          _buildCopyButton(context, value),
        ],
      ),
    );
  }

  Widget _buildCopyButton(BuildContext context, String value) {
    return IconButton(
      tooltip:
          widget.texts.copySuccess ?? UILocalizations.of(context)!.dialog_copy,
      icon: const Icon(Icons.copy_rounded, size: 16),
      onPressed: () => _copyToClipboard(context, value),
      style: IconButton.styleFrom(
        padding: const EdgeInsets.all(4),
        minimumSize: const Size(24, 24),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text(widget.texts.close),
      ),
      if (widget.onRetry != null)
        FilledButton(
          onPressed: _handleRetry,
          child: Text(widget.texts.retry),
        ),
    ];
  }

  bool get _hasDetails => widget.details != null && widget.details!.isNotEmpty;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  void _handleRetry() {
    Navigator.of(context).pop();
    widget.onRetry?.call();
  }

  Future<void> _copyToClipboard(BuildContext context, String text) async {
    try {
      await Clipboard.setData(ClipboardData(text: text));
      if (mounted) {
        _showCopySuccess(context);
      }
    } catch (e) {
      if (mounted) {
        _showCopyError(context);
      }
    }
  }

  void _showCopySuccess(BuildContext context) {
    final messenger = ScaffoldMessenger.maybeOf(context);
    messenger
      ?..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(widget.texts.copySuccess ??
              UILocalizations.of(context)!.dialog_copy_success),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
          showCloseIcon: true,
        ),
      );
  }

  void _showCopyError(BuildContext context) {
    final messenger = ScaffoldMessenger.maybeOf(context);
    messenger
      ?..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(widget.texts.copyError ??
              UILocalizations.of(context)!.dialog_copy_error),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
          showCloseIcon: true,
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
  }
}
