import 'package:intl/intl.dart';

String formatPrice(int? price) {
  if (price == null || price == 0) return 'N/A';

  double value = price.toDouble();

  if (value >= 10000000) {
    // 1 Crore = 10,000,000
    return '${(value / 10000000).toStringAsFixed(2).replaceAll(RegExp(r'\.00$'), '')} Crore';
  } else if (value >= 100000) {
    // 1 Lakh = 100,000
    return '${(value / 100000).toStringAsFixed(2).replaceAll(RegExp(r'\.00$'), '')} Lakh';
  } else if (value >= 1000) {
    // 1 Thousand = 1,000
    return '${(value / 1000).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')}k';
  } else {
    return value.toStringAsFixed(0);
  }
}


String formatWithCommas(int? price) {
  if (price == null) return '0';

  // 'en_IN' handles the 2-digit comma grouping (e.g., 1,00,000)
  final formatter = NumberFormat.currency(
    locale: 'en_IN',
    symbol: '₹', // You can change this to '' if you only want the number
    decimalDigits: 0,
  );

  return formatter.format(price);
}

String formatTimeAgo(DateTime postDate) {
  final Duration diff = DateTime.now().difference(postDate);

  if (diff.inDays >= 30) {
    int months = (diff.inDays / 30).floor();
    return months == 1 ? '1 month ago' : '$months months ago';
  } else if (diff.inDays >= 7) {
    int weeks = (diff.inDays / 7).floor();
    return weeks == 1 ? '1 week ago' : '$weeks weeks ago';
  } else if (diff.inDays >= 1) {
    return diff.inDays == 1 ? '1 day ago' : '${diff.inDays} days ago';
  } else if (diff.inHours >= 1) {
    return diff.inHours == 1 ? '1 hour ago' : '${diff.inHours} hours ago';
  } else if (diff.inMinutes >= 1) {
    return diff.inMinutes == 1 ? '1 minute ago' : '${diff.inMinutes} minutes ago';
  } else {
    return 'Just now';
  }
}