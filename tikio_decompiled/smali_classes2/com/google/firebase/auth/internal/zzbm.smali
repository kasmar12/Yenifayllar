.class public final synthetic Lcom/google/firebase/auth/internal/zzbm;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.3.0"

# interfaces
.implements Lcom/google/android/gms/tasks/Continuation;


# instance fields
.field private synthetic zza:Lcom/google/android/recaptcha/RecaptchaAction;

.field private synthetic zzb:Lcom/google/firebase/auth/FirebaseAuth;

.field private synthetic zzc:Ljava/lang/String;

.field private synthetic zzd:Lcom/google/android/gms/tasks/Continuation;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/recaptcha/RecaptchaAction;Lcom/google/firebase/auth/FirebaseAuth;Ljava/lang/String;Lcom/google/android/gms/tasks/Continuation;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzbm;->zza:Lcom/google/android/recaptcha/RecaptchaAction;

    iput-object p2, p0, Lcom/google/firebase/auth/internal/zzbm;->zzb:Lcom/google/firebase/auth/FirebaseAuth;

    iput-object p3, p0, Lcom/google/firebase/auth/internal/zzbm;->zzc:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/firebase/auth/internal/zzbm;->zzd:Lcom/google/android/gms/tasks/Continuation;

    return-void
.end method


# virtual methods
.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 4

    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzbm;->zza:Lcom/google/android/recaptcha/RecaptchaAction;

    iget-object v1, p0, Lcom/google/firebase/auth/internal/zzbm;->zzb:Lcom/google/firebase/auth/FirebaseAuth;

    iget-object v2, p0, Lcom/google/firebase/auth/internal/zzbm;->zzc:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/firebase/auth/internal/zzbm;->zzd:Lcom/google/android/gms/tasks/Continuation;

    invoke-static {v0, v1, v2, v3, p1}, Lcom/google/firebase/auth/internal/zzbn;->zza(Lcom/google/android/recaptcha/RecaptchaAction;Lcom/google/firebase/auth/FirebaseAuth;Ljava/lang/String;Lcom/google/android/gms/tasks/Continuation;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
