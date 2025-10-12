extension ErrorMessagesExtension on Object? {
  String getAllErrorMessages({String? message}) {
    final errors = this;

    if (errors == null ||
        (errors is List && errors.isEmpty)) {
      return message ?? "Unknown Error occurred";
    }

    if (errors is Map<String, dynamic>) {
      final errorMessage = errors.entries.map((entry) {
        final value = entry.value;
        if (value is List) {
          return value.join(', ');
        } else if (value is String) {
          return value;
        } else {
          return value.toString();
        }
      }).join('\n');
      return errorMessage;
    }

    if (errors is List) {
      return errors.join('\n');
    }
    return message ?? "Unknown Error occurred";
  }
}
