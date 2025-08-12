// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description: 
// -------------------------------------------------------------------
import 'dart:typed_data';

sealed class StreamEvent {
  const StreamEvent();
}
class StreamConnected extends StreamEvent { const StreamConnected(); }
class StreamData extends StreamEvent { final Uint8List bytes; const StreamData(this.bytes); }
class StreamClosed extends StreamEvent { final int? code; final String? reason; const StreamClosed({this.code, this.reason}); }
