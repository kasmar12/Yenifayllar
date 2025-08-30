.class public Lcom/google/firebase/auth/internal/zzb;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.3.0"


# static fields
.field private static final zza:Ljava/lang/String; = "zzb"

.field private static final zzb:Lcom/google/firebase/auth/internal/zzb;


# instance fields
.field private zzc:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 48
    new-instance v0, Lcom/google/firebase/auth/internal/zzb;

    invoke-direct {v0}, Lcom/google/firebase/auth/internal/zzb;-><init>()V

    sput-object v0, Lcom/google/firebase/auth/internal/zzb;->zzb:Lcom/google/firebase/auth/internal/zzb;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static zza()Lcom/google/firebase/auth/internal/zzb;
    .locals 1

    .line 46
    sget-object v0, Lcom/google/firebase/auth/internal/zzb;->zzb:Lcom/google/firebase/auth/internal/zzb;

    return-object v0
.end method

.method private final zza(Lcom/google/firebase/auth/FirebaseAuth;Lcom/google/firebase/auth/internal/zzcc;Landroid/app/Activity;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/auth/FirebaseAuth;",
            "Lcom/google/firebase/auth/internal/zzcc;",
            "Landroid/app/Activity;",
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Lcom/google/firebase/auth/internal/zze;",
            ">;)V"
        }
    .end annotation

    if-nez p3, :cond_0

    .line 51
    new-instance p1, Lcom/google/firebase/auth/FirebaseAuthMissingActivityForRecaptchaException;

    invoke-direct {p1}, Lcom/google/firebase/auth/FirebaseAuthMissingActivityForRecaptchaException;-><init>()V

    invoke-virtual {p4, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    return-void

    .line 54
    :cond_0
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseAuth;->getApp()Lcom/google/firebase/FirebaseApp;

    move-result-object p2

    invoke-virtual {p2}, Lcom/google/firebase/FirebaseApp;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    .line 56
    invoke-static {p2, p1}, Lcom/google/firebase/auth/internal/zzbj;->zza(Landroid/content/Context;Lcom/google/firebase/auth/FirebaseAuth;)V

    .line 59
    invoke-static {p3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    new-instance p2, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {p2}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    .line 61
    invoke-static {}, Lcom/google/firebase/auth/internal/zzas;->zza()Lcom/google/firebase/auth/internal/zzas;

    move-result-object v0

    .line 62
    invoke-virtual {v0, p3, p2}, Lcom/google/firebase/auth/internal/zzas;->zza(Landroid/app/Activity;Lcom/google/android/gms/tasks/TaskCompletionSource;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 64
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    const/16 p2, 0x42a1

    const-string p3, "reCAPTCHA flow already in progress"

    invoke-direct {p1, p2, p3}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 65
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacf;->zza(Lcom/google/android/gms/common/api/Status;)Lcom/google/firebase/FirebaseException;

    move-result-object p1

    .line 66
    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    goto :goto_0

    .line 67
    :cond_1
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzadr;

    invoke-direct {v0, p1, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzadr;-><init>(Lcom/google/firebase/auth/FirebaseAuth;Landroid/app/Activity;)V

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzadr;->zza()V

    .line 68
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    .line 69
    :goto_0
    new-instance p2, Lcom/google/firebase/auth/internal/zzf;

    invoke-direct {p2, p0, p4}, Lcom/google/firebase/auth/internal/zzf;-><init>(Lcom/google/firebase/auth/internal/zzb;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    .line 70
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lcom/google/firebase/auth/internal/zzc;

    invoke-direct {p2, p0, p4}, Lcom/google/firebase/auth/internal/zzc;-><init>(Lcom/google/firebase/auth/internal/zzb;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    .line 71
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method static bridge synthetic zza(Lcom/google/firebase/auth/internal/zzb;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzb;->zzc:Ljava/lang/String;

    return-void
.end method

.method public static zza(Ljava/lang/Exception;)Z
    .locals 1

    .line 89
    instance-of v0, p0, Lcom/google/firebase/auth/FirebaseAuthMissingActivityForRecaptchaException;

    if-nez v0, :cond_1

    instance-of v0, p0, Lcom/google/firebase/auth/FirebaseAuthException;

    if-eqz v0, :cond_0

    check-cast p0, Lcom/google/firebase/auth/FirebaseAuthException;

    .line 90
    invoke-virtual {p0}, Lcom/google/firebase/auth/FirebaseAuthException;->getErrorCode()Ljava/lang/String;

    move-result-object p0

    const-string v0, "UNAUTHORIZED_DOMAIN"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method static bridge synthetic zzb()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/google/firebase/auth/internal/zzb;->zza:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public final zza(Lcom/google/firebase/auth/FirebaseAuth;Ljava/lang/String;Landroid/app/Activity;ZZ)Lcom/google/android/gms/tasks/Task;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/auth/FirebaseAuth;",
            "Ljava/lang/String;",
            "Landroid/app/Activity;",
            "ZZ)",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/auth/internal/zze;",
            ">;"
        }
    .end annotation

    .line 2
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseAuth;->getFirebaseAuthSettings()Lcom/google/firebase/auth/FirebaseAuthSettings;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/auth/internal/zzab;

    .line 3
    invoke-static {}, Lcom/google/firebase/auth/internal/zzcc;->zzc()Lcom/google/firebase/auth/internal/zzcc;

    move-result-object v5

    .line 5
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseAuth;->getApp()Lcom/google/firebase/FirebaseApp;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaed;->zza(Lcom/google/firebase/FirebaseApp;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 6
    invoke-virtual {v0}, Lcom/google/firebase/auth/internal/zzab;->zze()Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_2

    .line 9
    :cond_0
    sget-object v1, Lcom/google/firebase/auth/internal/zzb;->zza:Ljava/lang/String;

    .line 10
    invoke-virtual {v0}, Lcom/google/firebase/auth/internal/zzab;->zzc()Z

    move-result v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "ForceRecaptchaFlow from phoneAuthOptions = "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, ", ForceRecaptchaFlow from firebaseSettings = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 11
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    invoke-virtual {v0}, Lcom/google/firebase/auth/internal/zzab;->zzc()Z

    move-result v0

    or-int/2addr p5, v0

    .line 13
    new-instance v0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    .line 14
    invoke-virtual {v5}, Lcom/google/firebase/auth/internal/zzcc;->zzb()Lcom/google/android/gms/tasks/Task;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 16
    invoke-virtual {v2}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 17
    new-instance p1, Lcom/google/firebase/auth/internal/zzl;

    invoke-direct {p1}, Lcom/google/firebase/auth/internal/zzl;-><init>()V

    .line 19
    invoke-virtual {v2}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/google/firebase/auth/internal/zzh;->zzb(Ljava/lang/String;)Lcom/google/firebase/auth/internal/zzh;

    move-result-object p1

    .line 20
    invoke-virtual {p1}, Lcom/google/firebase/auth/internal/zzh;->zza()Lcom/google/firebase/auth/internal/zze;

    move-result-object p1

    .line 21
    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1

    .line 23
    :cond_1
    invoke-virtual {v2}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Error in previous reCAPTCHA flow: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 24
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "Continuing with application verification as normal"

    .line 25
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    if-eqz p4, :cond_4

    if-nez p5, :cond_4

    .line 28
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseAuth;->getApp()Lcom/google/firebase/FirebaseApp;

    move-result-object p4

    invoke-virtual {p4}, Lcom/google/firebase/FirebaseApp;->getApplicationContext()Landroid/content/Context;

    move-result-object p4

    invoke-static {p4}, Lcom/google/android/play/core/integrity/IntegrityManagerFactory;->create(Landroid/content/Context;)Lcom/google/android/play/core/integrity/IntegrityManager;

    move-result-object p4

    .line 31
    iget-object p5, p0, Lcom/google/firebase/auth/internal/zzb;->zzc:Ljava/lang/String;

    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p5

    if-nez p5, :cond_3

    .line 32
    new-instance p5, Lcom/google/android/gms/internal/firebase-auth-api/zzafj;

    iget-object v1, p0, Lcom/google/firebase/auth/internal/zzb;->zzc:Ljava/lang/String;

    invoke-direct {p5, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafj;-><init>(Ljava/lang/String;)V

    .line 33
    invoke-static {p5}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p5

    goto :goto_0

    .line 35
    :cond_3
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseAuth;->zza()Lcom/google/android/gms/tasks/Task;

    move-result-object p5

    .line 38
    :goto_0
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseAuth;->zzf()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/google/firebase/auth/internal/zzd;

    invoke-direct {v2, p0, p2, p4}, Lcom/google/firebase/auth/internal/zzd;-><init>(Lcom/google/firebase/auth/internal/zzb;Ljava/lang/String;Lcom/google/android/play/core/integrity/IntegrityManager;)V

    .line 39
    invoke-virtual {p5, v1, v2}, Lcom/google/android/gms/tasks/Task;->continueWithTask(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p2

    .line 40
    new-instance p4, Lcom/google/firebase/auth/internal/zza;

    move-object v1, p4

    move-object v2, p0

    move-object v3, v0

    move-object v4, p1

    move-object v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/google/firebase/auth/internal/zza;-><init>(Lcom/google/firebase/auth/internal/zzb;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/firebase/auth/FirebaseAuth;Lcom/google/firebase/auth/internal/zzcc;Landroid/app/Activity;)V

    .line 41
    invoke-virtual {p2, p4}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    goto :goto_1

    .line 43
    :cond_4
    invoke-direct {p0, p1, v5, p3, v0}, Lcom/google/firebase/auth/internal/zzb;->zza(Lcom/google/firebase/auth/FirebaseAuth;Lcom/google/firebase/auth/internal/zzcc;Landroid/app/Activity;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    .line 44
    :goto_1
    invoke-virtual {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1

    .line 7
    :cond_5
    :goto_2
    new-instance p1, Lcom/google/firebase/auth/internal/zzl;

    invoke-direct {p1}, Lcom/google/firebase/auth/internal/zzl;-><init>()V

    .line 8
    invoke-virtual {p1}, Lcom/google/firebase/auth/internal/zzh;->zza()Lcom/google/firebase/auth/internal/zze;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method final synthetic zza(Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/firebase/auth/FirebaseAuth;Lcom/google/firebase/auth/internal/zzcc;Landroid/app/Activity;Lcom/google/android/gms/tasks/Task;)V
    .locals 3

    .line 74
    invoke-virtual {p5}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 75
    invoke-virtual {p5}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 76
    invoke-virtual {p5}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/play/core/integrity/IntegrityTokenResponse;

    invoke-virtual {v0}, Lcom/google/android/play/core/integrity/IntegrityTokenResponse;->token()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 79
    new-instance p2, Lcom/google/firebase/auth/internal/zzl;

    invoke-direct {p2}, Lcom/google/firebase/auth/internal/zzl;-><init>()V

    .line 81
    invoke-virtual {p5}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/google/android/play/core/integrity/IntegrityTokenResponse;

    invoke-virtual {p3}, Lcom/google/android/play/core/integrity/IntegrityTokenResponse;->token()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/google/firebase/auth/internal/zzh;->zza(Ljava/lang/String;)Lcom/google/firebase/auth/internal/zzh;

    move-result-object p2

    .line 82
    invoke-virtual {p2}, Lcom/google/firebase/auth/internal/zzh;->zza()Lcom/google/firebase/auth/internal/zze;

    move-result-object p2

    .line 83
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    return-void

    .line 85
    :cond_1
    invoke-virtual {p5}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object v0

    if-nez v0, :cond_2

    const-string p5, ""

    goto :goto_1

    :cond_2
    invoke-virtual {p5}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p5

    .line 86
    :goto_1
    sget-object v0, Lcom/google/firebase/auth/internal/zzb;->zza:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Play Integrity Token fetch failed, falling back to Recaptcha"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5

    invoke-static {v0, p5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    invoke-direct {p0, p2, p3, p4, p1}, Lcom/google/firebase/auth/internal/zzb;->zza(Lcom/google/firebase/auth/FirebaseAuth;Lcom/google/firebase/auth/internal/zzcc;Landroid/app/Activity;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    return-void
.end method
