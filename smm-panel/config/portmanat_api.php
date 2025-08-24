<?php
class PortmanatAPI {
    private $merchant_id;
    private $secret_key;
    private $api_url = 'https://api.portmanat.az';

    public function __construct() {
        $this->merchant_id = 'YOUR_MERCHANT_ID'; // Change this
        $this->secret_key = 'YOUR_SECRET_KEY'; // Change this
    }

    public function createPayment($amount, $orderId, $callbackUrl) {
        $data = [
            'merchant_id' => $this->merchant_id,
            'amount' => $amount,
            'order_id' => $orderId,
            'callback_url' => $callbackUrl,
            'currency' => 'AZN',
            'description' => 'SMM Panel Order #' . $orderId
        ];

        $data['sign'] = $this->generateSignature($data);
        
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->api_url . '/create-payment');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
        curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        
        $response = curl_exec($ch);
        curl_close($ch);
        
        return json_decode($response, true);
    }

    public function verifySignature($data, $signature) {
        $calculated_sign = $this->generateSignature($data);
        return $calculated_sign === $signature;
    }

    private function generateSignature($data) {
        $sign_string = $data['merchant_id'] . $data['amount'] . $data['order_id'] . $data['callback_url'];
        return hash_hmac('sha256', $sign_string, $this->secret_key);
    }

    public function getPaymentUrl($paymentId) {
        return $this->api_url . '/payment/' . $paymentId;
    }
}
?>