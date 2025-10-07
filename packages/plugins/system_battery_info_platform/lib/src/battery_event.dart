// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/10/07
// Description:
// -------------------------------------------------------------------

class BatteryEvent {
  final int level;
  final bool isCharging;

  BatteryEvent({required this.level, required this.isCharging});

  factory BatteryEvent.fromMap(Map<String, dynamic> map) {
    return BatteryEvent(
        level: map['level'] ?? -1, isCharging: map['isCharing'] ?? false);
  }

  Map<String, dynamic> toMap() => {
        'level': level,
        'isCharging': isCharging,
      };

  @override
  String toString() => 'BatteryEvent(level: $level, isCharging: $isCharging)';
}
