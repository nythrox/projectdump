
import 'dart:convert';
import 'dart:io';

import 'package:trekkers/profile/services/image_service.dart';
import 'package:trekkers/shared/models/iuser.dart';
import 'package:trekkers/shared/repositories/user_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';

abstract class IProfileDetailBloc {
  void selectPicker(ImageSource source);
  void userEvent(User user);
  Observable<User> get user;
  Observable<File> get previewImage;
  Observable<bool> get loading;
}

class ProfileDetailBloc implements IProfileDetailBloc {
  final IImageService _imageService;
  final IUserRepository _userRepository;
  final _imageSource$ = PublishSubject<ImageSource>();
  final _user$ = PublishSubject<User>();

  Observable<User> _user;
  Observable<File> previewImage;
  Observable<bool> loading;

  ProfileDetailBloc(this._imageService, this._userRepository) {
    final imageBase = _imageSource$
        .switchMap((e) => Observable.fromFuture(_imageService.pickImage(e)))
        .asBroadcastStream();

    final image = imageBase.asyncMap((e) => e
        .readAsBytes()
        .then((e) => base64Encode(e))
        .then((e) => 'data:image/jpeg;base64,$e'));

    previewImage = imageBase;
/*
    _user = _user$
        .withLatestFrom(image, (user, image) {
          final address = user.address;
          final updateUser = UpdateUserDto(
              address: UpdateAddressDto(
                  cep: address.cep,
                  city: address.city,
                  complement: address.complement,
                  neighborhood: address.neighborhood,
                  number: address.number,
                  state: address.state,
                  street: address.street),
              avatar: image,
              cellphone: user.cellphone);
          return updateUser;
        })
        .switchMap((e) =>
            Observable.fromFuture(_userRepository.update(e)).startWith(null))
        .asBroadcastStream();
*/
    loading = _user.map((e) => e == null).startWith(false);
  }

  @override
  Observable<User> get user => _user;

  @override
  void userEvent(User user) => _user$.add(user);

  @override
  void selectPicker(ImageSource source) => _imageSource$.add(source);

  @override
  void dispose() {
    _imageSource$.close();
    _user$.close();
  }
}

