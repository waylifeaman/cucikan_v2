class HomeDashboardModel {
  final double todayIncome;
  final int todayOrders;
  final int processingOrders;
  final int finishedOrders;

  const HomeDashboardModel({
    required this.todayIncome,
    required this.todayOrders,
    required this.processingOrders,
    required this.finishedOrders,
  });

  factory HomeDashboardModel.empty() {
    return const HomeDashboardModel(
      todayIncome: 0,
      todayOrders: 0,
      processingOrders: 0,
      finishedOrders: 0,
    );
  }
}
