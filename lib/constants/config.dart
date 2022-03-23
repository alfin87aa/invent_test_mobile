import '../index.dart';

class AppConfigs {
  static const String appName = 'Test MobileCom';

  ///API URL
  static const baseUrl = "http://invent-integrasi.com/test_core/v1/";

  ///Paging
  static const pageSize = 10;
  static const pageSizeMax = 100;

  ///DateFormat
  static const dateApiFormat = 'yyyy-MM-dd';
  static const dateDisplyaFormat = 'dd MMM yyyy';

  static const dateTimeApiFormat = "MM/dd/yyyy'T'hh:mm:ss.SSSZ";
  static const dateTimeDisplayFormat = 'dd/MM/yyyy HH:mm';

  ///Date range
  static final identityMinDate = DateTime(1900, 1, 1);
  static final identityMaxDate = DateTime.now();

  ///Font
  static const fontFamily = 'Roboto';

  static const appPrimaryColor = ColorConstants.orange500;
  static const appAccentPrimaryColor = ColorConstants.orange300;
  static const scaffoldLightColor = Color(0xFFEBF2F7);
  static const appLayoutBackground = Color(0xFFf8f8f8);
  static const viewLineColor = Color(0xFFEAEAEA);
  static const textPrimaryColor = Color(0xFF2E3033);
  static const textSecondaryColor = Color(0xFF757575);

  static const scaffoldDarkColor = Color(0xFF12181B);
  static const appBackgroundColorDark = Color(0xFF121212);
  static const appSecondaryBackgroundColor = Color(0xFF131d25);
  static const cardBackgroundBlackDark = Color(0xFF1F1F1F);
}
