// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description: 
// -------------------------------------------------------------------
import 'package:network_core/core.dart';
import 'failure.dart';

typedef AppResult<T> = Result<T, Failure>;
typedef NetResult<T> = Result<T, NetFailure>;
