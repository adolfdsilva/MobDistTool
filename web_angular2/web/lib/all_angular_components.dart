import 'package:angular2/core.dart';
import 'components/top_bar_component.dart';
import 'components/bottom_bar_component.dart';
import 'components/route_bar_component.dart';
import 'components/user_login_component.dart';
import 'components/modals_components.dart';
import 'components/edit_application_component.dart';

import 'services/modal_service.dart';
import 'services/global_service.dart';
import 'services/mdt_query.dart';

import 'pages/home_component.dart';
import 'pages/application_list_component.dart';
import 'pages/application_detail_component.dart';
import 'pages/administration_component.dart';
import 'pages/account_component.dart';
import 'pages/activation_component.dart';

export 'components/top_bar_component.dart';
export 'components/bottom_bar_component.dart';
export 'components/route_bar_component.dart';
export 'components/user_login_component.dart';
export 'components/edit_application_component.dart';
export 'components/modals_components.dart' hide ModalRequired;


export 'services/modal_service.dart';
export 'services/global_service.dart';
export 'services/mdt_query.dart';

export 'pages/home_component.dart';
export 'pages/application_list_component.dart';
export 'pages/application_detail_component.dart';
export 'pages/administration_component.dart';
export 'pages/account_component.dart';
export 'pages/activation_component.dart';

const List<Type> MDT_DIRECTIVES = const [BottomBarComponent,RouteBarComponent,TopBarComponent,ModalsComponent,
HomeComponent,ApplicationListComponent,ApplicationDetailComponent,AdministrationComponent,AccountComponent,EditAppComponent,ActivationComponent];
const List<Type> MDT_PROVIDERS = const [ModalService,GlobalService,MDTQueryService];
