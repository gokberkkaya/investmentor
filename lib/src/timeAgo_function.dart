String timeAgoSinceDate(String dateString) {
  DateTime notificationDate = DateTime.parse(dateString);
  Duration difference = DateTime.now().difference(notificationDate);

  if (difference.inDays > 365) {
    return '${(difference.inDays / 365).floor()} yıl önce';
  } else if (difference.inDays > 30) {
    return '${(difference.inDays / 30).floor()} ay önce';
  } else if (difference.inDays > 7) {
    return '${(difference.inDays / 7).floor()} hafta önce';
  } else if (difference.inDays > 0) {
    return '${difference.inDays} gün önce';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} saat önce';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} dk önce';
  } else {
    return 'Şimdi';
  }
}