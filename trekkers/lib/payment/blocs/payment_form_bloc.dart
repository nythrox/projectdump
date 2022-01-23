import 'package:rxdart/rxdart.dart';
import 'package:trekkers/payment/models/payment_form_dto.dart';
import 'package:trekkers/payment/repositories/payment_repository.dart';

class PaymentFormBloc {
  final PaymentRepository _paymentRepository;

  final _cupom$ = BehaviorSubject<String>();
  get addCupom => _cupom$.add;
  final _numeroCartao$ = BehaviorSubject<String>();
  get addNumeroCartao => _numeroCartao$.add;
  final _codigoSeguranca$ = BehaviorSubject<String>();
  get addCodigoSeguranca => _codigoSeguranca$.add;
  final _numeroParcelas$ = BehaviorSubject<String>();
  get addNumeroParcelas => _numeroParcelas$.add;

  final _result$ = BehaviorSubject();
  Observable get result => _result$;

  final _loading$ = BehaviorSubject<bool>();
  Observable<bool> get loading => _loading$;

  PaymentFormBloc(this._paymentRepository) {
    Observable.zip([_numeroCartao$, _codigoSeguranca$, _numeroParcelas$],
        (values) {
      return PaymentFormDto(values[0], values[1], int.parse(values[2]));
    }).switchMap((PaymentFormDto payment) {
      _loading$.add(true);
      return Observable.fromFuture(_paymentRepository.buyTicket(payment));
    });

    _result$.listen((e) {
      _loading$.add(null);
    });
  }

  void dispose() {
    _cupom$.close();
    _loading$.close();
    _numeroCartao$.close();
    _codigoSeguranca$.close();
    _numeroParcelas$.close();
    _result$.close();
  }
}
