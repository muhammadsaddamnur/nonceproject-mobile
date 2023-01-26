part of 'dashboard_cubit.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = Initial;
  const factory DashboardState.success({
    double? native,
    double? usdc,
  }) = Success;
}
