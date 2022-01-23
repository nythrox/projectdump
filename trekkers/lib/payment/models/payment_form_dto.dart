
class PaymentFormDto {
  final String numeroCartao;
  final String codigoSeguranca;
  final int numeroParcelas;

  PaymentFormDto(this.numeroCartao, this.codigoSeguranca, this.numeroParcelas);
}
