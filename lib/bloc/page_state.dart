part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLoginPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnRegistrationPage extends PageState {
  final RegistrationData registrationData;

  OnRegistrationPage(this.registrationData);
  @override
  List<Object> get props => [];
}

class OnAccountConfirmationPage extends PageState {
  final RegistrationData registrationData;

  OnAccountConfirmationPage(this.registrationData);
  @override
  List<Object> get props => [];
}

class OnArticlePage extends PageState {
  @override
  List<Object> get props => [];
}

class OnCameraPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnGalleryPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnProfilePage extends PageState {
  @override
  List<Object> get props => [];
}

class OnEditProfilePage extends PageState {
  @override
  List<Object> get props => [];
}

class OnTambahDatasetPage extends PageState {
  @override
  List<Object> get props => [];
}
