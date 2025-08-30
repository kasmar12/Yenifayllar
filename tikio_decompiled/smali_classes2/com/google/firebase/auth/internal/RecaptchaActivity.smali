.class public Lcom/google/firebase/auth/internal/RecaptchaActivity;
.super Landroidx/fragment/app/FragmentActivity;
.source "com.google.firebase:firebase-auth@@22.3.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzack;


# static fields
.field private static final zzb:Ljava/lang/String; = "RecaptchaActivity"

.field private static zzc:J

.field private static final zzd:Lcom/google/firebase/auth/internal/zzcc;


# instance fields
.field private zze:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 59
    invoke-static {}, Lcom/google/firebase/auth/internal/zzcc;->zzc()Lcom/google/firebase/auth/internal/zzcc;

    move-result-object v0

    sput-object v0, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zzd:Lcom/google/firebase/auth/internal/zzcc;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 61
    invoke-direct {p0}, Landroidx/fragment/app/FragmentActivity;-><init>()V

    const/4 v0, 0x0

    .line 62
    iput-boolean v0, p0, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zze:Z

    return-void
.end method

.method private final zza(Landroid/net/Uri$Builder;Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;
    .locals 11

    const-string v0, "com.google.firebase.auth.KEY_API_KEY"

    .line 2
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.google.firebase.auth.internal.CLIENT_VERSION"

    .line 4
    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v2, "com.google.firebase.auth.internal.FIREBASE_APP_NAME"

    .line 5
    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 6
    invoke-static {p2}, Lcom/google/firebase/FirebaseApp;->getInstance(Ljava/lang/String;)Lcom/google/firebase/FirebaseApp;

    move-result-object v9

    .line 7
    invoke-static {v9}, Lcom/google/firebase/auth/FirebaseAuth;->getInstance(Lcom/google/firebase/FirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object v10

    .line 8
    invoke-static {}, Lcom/google/firebase/auth/internal/zzn;->zza()Lcom/google/firebase/auth/internal/zzn;

    move-result-object v2

    .line 9
    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const-string v6, "com.google.firebase.auth.internal.ACTION_SHOW_RECAPTCHA"

    move-object v4, p3

    move-object v5, v1

    move-object v7, p2

    .line 10
    invoke-virtual/range {v2 .. v7}, Lcom/google/firebase/auth/internal/zzn;->zza(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v9}, Lcom/google/firebase/FirebaseApp;->getPersistenceKey()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/firebase/auth/internal/zzp;->zza(Landroid/content/Context;Ljava/lang/String;)Lcom/google/firebase/auth/internal/zzp;

    move-result-object v2

    .line 13
    invoke-virtual {v2}, Lcom/google/firebase/auth/internal/zzp;->zza()Ljava/lang/String;

    move-result-object v2

    .line 14
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 15
    sget-object p1, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zzb:Ljava/lang/String;

    const-string p2, "Could not generate an encryption key for reCAPTCHA - cancelling flow."

    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string p1, "Failed to generate/retrieve public encryption key for reCAPTCHA flow."

    .line 17
    invoke-static {p1}, Lcom/google/firebase/auth/internal/zzan;->zza(Ljava/lang/String;)Lcom/google/android/gms/common/api/Status;

    move-result-object p1

    .line 18
    invoke-direct {p0, p1}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zza(Lcom/google/android/gms/common/api/Status;)V

    const/4 p1, 0x0

    return-object p1

    .line 20
    :cond_0
    invoke-virtual {v10}, Lcom/google/firebase/auth/FirebaseAuth;->getLanguageCode()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 21
    invoke-virtual {v10}, Lcom/google/firebase/auth/FirebaseAuth;->getLanguageCode()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 22
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzacw;->zza()Ljava/lang/String;

    move-result-object v3

    :goto_0
    const-string v4, "apiKey"

    .line 24
    invoke-virtual {p1, v4, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v4, "authType"

    const-string v5, "verifyApp"

    .line 25
    invoke-virtual {v0, v4, v5}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v4, "apn"

    .line 26
    invoke-virtual {v0, v4, p3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p3

    const-string v0, "hl"

    .line 27
    invoke-virtual {p3, v0, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p3

    const-string v0, "eventId"

    .line 28
    invoke-virtual {p3, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "X"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "v"

    .line 29
    invoke-virtual {p3, v1, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p3

    const-string v0, "eid"

    const-string v1, "p"

    .line 30
    invoke-virtual {p3, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p3

    const-string v0, "appName"

    .line 31
    invoke-virtual {p3, v0, p2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p2

    const-string p3, "sha1Cert"

    .line 32
    invoke-virtual {p2, p3, p4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p2

    const-string p3, "publicKey"

    .line 33
    invoke-virtual {p2, p3, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    return-object p1
.end method

.method static synthetic zza(Landroid/net/Uri;Lcom/google/android/gms/tasks/Task;)Landroid/net/Uri;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 38
    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    .line 39
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 40
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/appcheck/AppCheckTokenResult;

    .line 41
    invoke-virtual {p1}, Lcom/google/firebase/appcheck/AppCheckTokenResult;->getError()Ljava/lang/Exception;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 42
    sget-object v0, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zzb:Ljava/lang/String;

    .line 43
    invoke-virtual {p1}, Lcom/google/firebase/appcheck/AppCheckTokenResult;->getError()Ljava/lang/Exception;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Error getting App Check token; using placeholder token instead. Error: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 44
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    :cond_0
    invoke-virtual {p1}, Lcom/google/firebase/appcheck/AppCheckTokenResult;->getToken()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "fac="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/net/Uri$Builder;->fragment(Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_0

    .line 47
    :cond_1
    sget-object v0, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zzb:Ljava/lang/String;

    .line 48
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unexpected error getting App Check token: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 49
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    :goto_0
    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method private final zza(Lcom/google/android/gms/common/api/Status;)V
    .locals 2

    const-wide/16 v0, 0x0

    .line 72
    sput-wide v0, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zzc:J

    const/4 v0, 0x0

    .line 73
    iput-boolean v0, p0, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zze:Z

    .line 74
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 75
    invoke-static {v0, p1}, Lcom/google/firebase/auth/internal/zzca;->zza(Landroid/content/Intent;Lcom/google/android/gms/common/api/Status;)V

    const-string p1, "com.google.firebase.auth.ACTION_RECEIVE_FIREBASE_AUTH_INTENT"

    .line 76
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 77
    invoke-direct {p0, v0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zza(Landroid/content/Intent;)Z

    .line 78
    sget-object p1, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zzd:Lcom/google/firebase/auth/internal/zzcc;

    invoke-virtual {p1, p0}, Lcom/google/firebase/auth/internal/zzcc;->zza(Landroid/content/Context;)V

    .line 79
    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->finish()V

    return-void
.end method

.method private final zza(Landroid/content/Intent;)Z
    .locals 1

    .line 218
    invoke-static {p0}, Landroidx/localbroadcastmanager/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroidx/localbroadcastmanager/content/LocalBroadcastManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/localbroadcastmanager/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    move-result p1

    return p1
.end method

.method private final zzb()V
    .locals 3

    const-wide/16 v0, 0x0

    .line 63
    sput-wide v0, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zzc:J

    const/4 v0, 0x0

    .line 64
    iput-boolean v0, p0, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zze:Z

    .line 65
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.google.firebase.auth.internal.EXTRA_CANCELED"

    const/4 v2, 0x1

    .line 66
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v1, "com.google.firebase.auth.ACTION_RECEIVE_FIREBASE_AUTH_INTENT"

    .line 67
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 68
    invoke-direct {p0, v0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zza(Landroid/content/Intent;)Z

    .line 69
    sget-object v0, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zzd:Lcom/google/firebase/auth/internal/zzcc;

    invoke-virtual {v0, p0}, Lcom/google/firebase/auth/internal/zzcc;->zza(Landroid/content/Context;)V

    .line 70
    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->finish()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7

    .line 121
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 122
    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.google.firebase.auth.internal.ACTION_SHOW_RECAPTCHA"

    .line 123
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "android.intent.action.VIEW"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 124
    sget-object p1, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zzb:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Could not do operation - unknown action: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    invoke-direct {p0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zzb()V

    return-void

    .line 127
    :cond_0
    invoke-static {}, Lcom/google/android/gms/common/util/DefaultClock;->getInstance()Lcom/google/android/gms/common/util/Clock;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v0

    .line 128
    sget-wide v2, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zzc:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x7530

    cmp-long v6, v2, v4

    if-gez v6, :cond_1

    .line 129
    sget-object p1, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zzb:Ljava/lang/String;

    const-string v0, "Could not start operation - already in progress"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 131
    :cond_1
    sput-wide v0, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zzc:J

    if-eqz p1, :cond_2

    const-string v0, "com.google.firebase.auth.internal.KEY_ALREADY_STARTED_RECAPTCHA_FLOW"

    .line 134
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zze:Z

    :cond_2
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 0

    .line 136
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 137
    invoke-virtual {p0, p1}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->setIntent(Landroid/content/Intent;)V

    return-void
.end method

.method protected onResume()V
    .locals 10

    .line 139
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onResume()V

    .line 140
    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.VIEW"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_5

    .line 141
    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v3, "firebaseError"

    .line 142
    invoke-virtual {v0, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 143
    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 144
    invoke-static {v0}, Lcom/google/firebase/auth/internal/zzca;->zza(Ljava/lang/String;)Lcom/google/android/gms/common/api/Status;

    move-result-object v0

    .line 145
    invoke-direct {p0, v0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zza(Lcom/google/android/gms/common/api/Status;)V

    return-void

    :cond_0
    const-string v3, "link"

    .line 146
    invoke-virtual {v0, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    const-string v4, "eventId"

    invoke-virtual {v0, v4}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 147
    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 148
    invoke-static {}, Lcom/google/firebase/auth/internal/zzn;->zza()Lcom/google/firebase/auth/internal/zzn;

    move-result-object v5

    .line 149
    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 150
    invoke-virtual {v5, v6, v7, v4}, Lcom/google/firebase/auth/internal/zzn;->zzb(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 151
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 152
    sget-object v5, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zzb:Ljava/lang/String;

    const-string v6, "Failed to find registration for this event - failing to prevent session injection."

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string v5, "Failed to find registration for this reCAPTCHA event"

    .line 154
    invoke-static {v5}, Lcom/google/firebase/auth/internal/zzan;->zza(Ljava/lang/String;)Lcom/google/android/gms/common/api/Status;

    move-result-object v5

    .line 155
    invoke-direct {p0, v5}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zza(Lcom/google/android/gms/common/api/Status;)V

    :cond_1
    const-string v5, "encryptionEnabled"

    .line 156
    invoke-virtual {v0, v5, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 158
    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 159
    invoke-static {v4}, Lcom/google/firebase/FirebaseApp;->getInstance(Ljava/lang/String;)Lcom/google/firebase/FirebaseApp;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/firebase/FirebaseApp;->getPersistenceKey()Ljava/lang/String;

    move-result-object v2

    .line 160
    invoke-static {v0, v2}, Lcom/google/firebase/auth/internal/zzp;->zza(Landroid/content/Context;Ljava/lang/String;)Lcom/google/firebase/auth/internal/zzp;

    move-result-object v0

    .line 161
    invoke-virtual {v0, v3}, Lcom/google/firebase/auth/internal/zzp;->zza(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 162
    :cond_2
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v2, "recaptchaToken"

    .line 163
    invoke-virtual {v0, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-wide/16 v2, 0x0

    .line 165
    sput-wide v2, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zzc:J

    .line 166
    iput-boolean v1, p0, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zze:Z

    .line 167
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-string v2, "com.google.firebase.auth.internal.RECAPTCHA_TOKEN"

    .line 168
    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "com.google.firebase.auth.internal.OPERATION"

    const-string v3, "com.google.firebase.auth.internal.ACTION_SHOW_RECAPTCHA"

    .line 169
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "com.google.firebase.auth.ACTION_RECEIVE_FIREBASE_AUTH_INTENT"

    .line 170
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 171
    invoke-direct {p0, v1}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zza(Landroid/content/Intent;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 174
    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 176
    invoke-static {v1, v0, v3}, Lcom/google/firebase/auth/internal/zzbj;->zza(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 178
    :cond_3
    sget-object v0, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zzd:Lcom/google/firebase/auth/internal/zzcc;

    invoke-virtual {v0, p0}, Lcom/google/firebase/auth/internal/zzcc;->zza(Landroid/content/Context;)V

    .line 179
    :goto_0
    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->finish()V

    return-void

    .line 181
    :cond_4
    invoke-direct {p0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zzb()V

    return-void

    .line 183
    :cond_5
    iget-boolean v0, p0, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zze:Z

    if-nez v0, :cond_7

    .line 184
    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    .line 185
    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    .line 187
    :try_start_0
    invoke-static {p0, v4}, Lcom/google/android/gms/common/util/AndroidUtilsLight;->getPackageCertificateHashBytes(Landroid/content/Context;Ljava/lang/String;)[B

    move-result-object v0

    .line 188
    invoke-static {v0}, Lcom/google/android/gms/common/util/Hex;->bytesToStringUppercase([B)Ljava/lang/String;

    move-result-object v0

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 189
    invoke-virtual {v0, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v0, "com.google.firebase.auth.internal.FIREBASE_APP_NAME"

    .line 196
    invoke-virtual {v6, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 197
    invoke-static {v0}, Lcom/google/firebase/FirebaseApp;->getInstance(Ljava/lang/String;)Lcom/google/firebase/FirebaseApp;

    move-result-object v7

    .line 198
    invoke-static {v7}, Lcom/google/firebase/auth/FirebaseAuth;->getInstance(Lcom/google/firebase/FirebaseApp;)Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object v0

    .line 199
    invoke-static {v7}, Lcom/google/android/gms/internal/firebase-auth-api/zzaed;->zza(Lcom/google/firebase/FirebaseApp;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 200
    new-instance v9, Lcom/google/android/gms/internal/firebase-auth-api/zzaci;

    move-object v3, v9

    move-object v8, p0

    invoke-direct/range {v3 .. v8}, Lcom/google/android/gms/internal/firebase-auth-api/zzaci;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;Lcom/google/firebase/FirebaseApp;Lcom/google/android/gms/internal/firebase-auth-api/zzack;)V

    .line 201
    invoke-virtual {v0}, Lcom/google/firebase/auth/FirebaseAuth;->zze()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v9, v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaci;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_1

    .line 203
    :cond_6
    invoke-virtual {v7}, Lcom/google/firebase/FirebaseApp;->getOptions()Lcom/google/firebase/FirebaseOptions;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/FirebaseOptions;->getApiKey()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaed;->zza(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 205
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    .line 206
    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    .line 207
    invoke-direct {p0, v1, v3, v4, v5}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zza(Landroid/net/Uri$Builder;Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    .line 208
    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    .line 209
    invoke-virtual {v0}, Lcom/google/firebase/auth/FirebaseAuth;->zzc()Lcom/google/firebase/inject/Provider;

    move-result-object v0

    .line 210
    invoke-virtual {p0, v1, v4, v0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zza(Landroid/net/Uri;Ljava/lang/String;Lcom/google/firebase/inject/Provider;)V

    goto :goto_1

    :catch_0
    move-exception v0

    .line 192
    sget-object v1, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zzb:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "Could not get package signature: "

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    invoke-static {p0, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzacj;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzack;Ljava/lang/String;)V

    .line 211
    :goto_1
    iput-boolean v2, p0, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zze:Z

    return-void

    .line 213
    :cond_7
    invoke-direct {p0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zzb()V

    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 215
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 216
    iget-boolean v0, p0, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zze:Z

    const-string v1, "com.google.firebase.auth.internal.KEY_ALREADY_STARTED_RECAPTCHA_FLOW"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public final zza()Landroid/content/Context;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public final zza(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;
    .locals 2

    .line 35
    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    const-string v1, "https"

    .line 36
    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "__"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "auth"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "handler"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    .line 37
    invoke-direct {p0, v0, p1, p2, p3}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zza(Landroid/net/Uri$Builder;Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final zza(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 51
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaed;->zzb(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final zza(Ljava/net/URL;)Ljava/net/HttpURLConnection;
    .locals 2

    .line 52
    :try_start_0
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzb;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzb;

    move-result-object v0

    const-string v1, "client-firebase-auth-api"

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzb;->zza(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 55
    :catch_0
    sget-object p1, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zza:Lcom/google/android/gms/common/logging/Logger;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Error generating connection"

    invoke-virtual {p1, v1, v0}, Lcom/google/android/gms/common/logging/Logger;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public final zza(Landroid/net/Uri;Ljava/lang/String;Lcom/google/firebase/inject/Provider;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "Lcom/google/firebase/inject/Provider<",
            "Lcom/google/firebase/appcheck/interop/InteropAppCheckTokenProvider;",
            ">;)V"
        }
    .end annotation

    .line 86
    invoke-interface {p3}, Lcom/google/firebase/inject/Provider;->get()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/google/firebase/appcheck/interop/InteropAppCheckTokenProvider;

    if-eqz p3, :cond_0

    const/4 v0, 0x0

    .line 89
    invoke-interface {p3, v0}, Lcom/google/firebase/appcheck/interop/InteropAppCheckTokenProvider;->getToken(Z)Lcom/google/android/gms/tasks/Task;

    move-result-object p3

    new-instance v0, Lcom/google/firebase/auth/internal/zzbk;

    invoke-direct {v0, p1}, Lcom/google/firebase/auth/internal/zzbk;-><init>(Landroid/net/Uri;)V

    .line 90
    invoke-virtual {p3, v0}, Lcom/google/android/gms/tasks/Task;->continueWith(Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    goto :goto_0

    .line 92
    :cond_0
    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    .line 93
    :goto_0
    new-instance p3, Lcom/google/firebase/auth/internal/zzbl;

    invoke-direct {p3, p0, p2}, Lcom/google/firebase/auth/internal/zzbl;-><init>(Lcom/google/firebase/auth/internal/RecaptchaActivity;Ljava/lang/String;)V

    .line 94
    invoke-virtual {p1, p3}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public final zza(Ljava/lang/String;Lcom/google/android/gms/common/api/Status;)V
    .locals 0

    if-nez p2, :cond_0

    .line 82
    invoke-direct {p0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zzb()V

    return-void

    .line 83
    :cond_0
    invoke-direct {p0, p2}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zza(Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method

.method final synthetic zza(Ljava/lang/String;Lcom/google/android/gms/tasks/Task;)V
    .locals 6

    .line 97
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 98
    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_3

    .line 102
    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    new-instance v4, Landroid/content/Intent;

    const-string v5, "android.support.customtabs.action.CustomTabsService"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 103
    invoke-virtual {v0, v4, v3}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 104
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v3, 0x1

    :cond_1
    const/high16 v0, 0x10000000

    const/high16 v2, 0x40000000    # 2.0f

    if-eqz v3, :cond_2

    .line 106
    new-instance p1, Landroidx/browser/customtabs/CustomTabsIntent$Builder;

    invoke-direct {p1}, Landroidx/browser/customtabs/CustomTabsIntent$Builder;-><init>()V

    invoke-virtual {p1}, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->build()Landroidx/browser/customtabs/CustomTabsIntent;

    move-result-object p1

    .line 107
    iget-object v1, p1, Landroidx/browser/customtabs/CustomTabsIntent;->intent:Landroid/content/Intent;

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 108
    iget-object v1, p1, Landroidx/browser/customtabs/CustomTabsIntent;->intent:Landroid/content/Intent;

    invoke-virtual {v1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 109
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/net/Uri;

    invoke-virtual {p1, p0, p2}, Landroidx/browser/customtabs/CustomTabsIntent;->launchUrl(Landroid/content/Context;Landroid/net/Uri;)V

    return-void

    .line 111
    :cond_2
    new-instance v3, Landroid/content/Intent;

    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/net/Uri;

    invoke-direct {v3, v1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string p2, "com.android.browser.application_id"

    .line 112
    invoke-virtual {v3, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 113
    invoke-virtual {v3, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 114
    invoke-virtual {v3, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 115
    invoke-virtual {p0, v3}, Lcom/google/firebase/auth/internal/RecaptchaActivity;->startActivity(Landroid/content/Intent;)V

    return-void

    .line 117
    :cond_3
    sget-object p2, Lcom/google/firebase/auth/internal/RecaptchaActivity;->zzb:Ljava/lang/String;

    const-string v0, "Device cannot resolve intent for: android.intent.action.VIEW"

    invoke-static {p2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacj;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzack;Ljava/lang/String;)V

    return-void
.end method
