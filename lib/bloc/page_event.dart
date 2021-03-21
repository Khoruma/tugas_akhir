part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToRegistrationPage extends PageEvent {
  final RegistrationData registrationData;

  GoToRegistrationPage(this.registrationData);
  @override
  List<Object> get props => [];
}

class GoToAccountConfirmationPage extends PageEvent {
  final RegistrationData registrationData;

  GoToAccountConfirmationPage(this.registrationData);
  @override
  List<Object> get props => [];
}

class GoToArticlePage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToGalleryPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToCameraPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToTambahDatasetPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToProfilePage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToEditProfilePage extends PageEvent {
  @override
  List<Object> get props => [];
}
