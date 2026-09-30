import 'package:my_life/features/finance/domain/entity/finance_tool.dart';

abstract interface class IFinanceRepository {
  List<FinanceTool> get tools;
}
