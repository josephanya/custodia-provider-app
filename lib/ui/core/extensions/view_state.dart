import 'package:custodia_provider/ui/core/enums/view_state.dart';

extension ViewStateExtension on ViewState {
  bool get isLoading => this == ViewState.loading;

  bool get isIdle => this == ViewState.idle;

  bool get isError => this == ViewState.error;
}
