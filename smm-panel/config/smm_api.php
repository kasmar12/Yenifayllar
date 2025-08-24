<?php
class SMMAPI {
    private $api_url;
    private $api_key;

    public function __construct() {
        $this->api_url = 'https://your-smm-api.com/api'; // Change this
        $this->api_key = 'YOUR_SMM_API_KEY'; // Change this
    }

    public function createOrder($serviceId, $link, $amount) {
        $data = [
            'key' => $this->api_key,
            'action' => 'add',
            'service' => $serviceId,
            'link' => $link,
            'quantity' => $amount
        ];

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->api_url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        
        $response = curl_exec($ch);
        curl_close($ch);
        
        return json_decode($response, true);
    }

    public function getOrderStatus($orderId) {
        $data = [
            'key' => $this->api_key,
            'action' => 'status',
            'order' => $orderId
        ];

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->api_url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        
        $response = curl_exec($ch);
        curl_close($ch);
        
        return json_decode($response, true);
    }
}
?>