.class final Lcom/google/firebase/auth/zzk;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.3.0"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/tasks/OnCompleteListener<",
        "Lcom/google/firebase/auth/internal/zze;",
        ">;"
    }
.end annotation


# instance fields
.field private final synthetic zza:Lcom/google/firebase/auth/PhoneAuthOptions;

.field private final synthetic zzb:Ljava/lang/String;

.field private final synthetic zzc:Lcom/google/firebase/auth/FirebaseAuth;


# direct methods
.method constructor <init>(Lcom/google/firebase/auth/FirebaseAuth;Lcom/google/firebase/auth/PhoneAuthOptions;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/firebase/auth/zzk;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    iput-object p2, p0, Lcom/google/firebase/auth/zzk;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    iput-object p3, p0, Lcom/google/firebase/auth/zzk;->zzb:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/auth/internal/zze;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p0

    .line 4
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_2

    const-string v1, "Error while validating application identity: "

    .line 6
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 8
    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_0
    const-string v4, "FirebaseAuth"

    .line 9
    invoke-static {v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v3, :cond_1

    .line 11
    invoke-static {v3}, Lcom/google/firebase/auth/internal/zzb;->zza(Ljava/lang/Exception;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 12
    check-cast v3, Lcom/google/firebase/FirebaseException;

    iget-object v1, v0, Lcom/google/firebase/auth/zzk;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    iget-object v2, v0, Lcom/google/firebase/auth/zzk;->zzb:Ljava/lang/String;

    invoke-static {v3, v1, v2}, Lcom/google/firebase/auth/FirebaseAuth;->zza(Lcom/google/firebase/FirebaseException;Lcom/google/firebase/auth/PhoneAuthOptions;Ljava/lang/String;)V

    return-void

    :cond_1
    const-string v1, "Proceeding without any application identifier."

    .line 14
    invoke-static {v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v11, v2

    move-object v12, v11

    goto :goto_0

    .line 16
    :cond_2
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/auth/internal/zze;

    invoke-virtual {v1}, Lcom/google/firebase/auth/internal/zze;->zzc()Ljava/lang/String;

    move-result-object v2

    .line 17
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/auth/internal/zze;

    invoke-virtual {v1}, Lcom/google/firebase/auth/internal/zze;->zza()Ljava/lang/String;

    move-result-object v1

    move-object v12, v1

    move-object v11, v2

    .line 18
    :goto_0
    iget-object v1, v0, Lcom/google/firebase/auth/zzk;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    invoke-virtual {v1}, Lcom/google/firebase/auth/PhoneAuthOptions;->zzg()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    .line 19
    iget-object v1, v0, Lcom/google/firebase/auth/zzk;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    iget-object v2, v0, Lcom/google/firebase/auth/zzk;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 20
    invoke-virtual {v2}, Lcom/google/firebase/auth/PhoneAuthOptions;->zzh()Ljava/lang/String;

    move-result-object v2

    iget-object v3, v0, Lcom/google/firebase/auth/zzk;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    invoke-virtual {v3}, Lcom/google/firebase/auth/PhoneAuthOptions;->zze()Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;

    move-result-object v3

    .line 21
    invoke-static {v1, v2, v3}, Lcom/google/firebase/auth/FirebaseAuth;->zza(Lcom/google/firebase/auth/FirebaseAuth;Ljava/lang/String;Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;)Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;

    move-result-object v1

    .line 22
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 23
    iget-object v2, v0, Lcom/google/firebase/auth/zzk;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    iget-object v3, v0, Lcom/google/firebase/auth/zzk;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    invoke-virtual {v2, v3, v1}, Lcom/google/firebase/auth/FirebaseAuth;->zza(Lcom/google/firebase/auth/PhoneAuthOptions;Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;)Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;

    move-result-object v1

    :cond_3
    move-object v14, v1

    .line 24
    iget-object v1, v0, Lcom/google/firebase/auth/zzk;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 25
    invoke-virtual {v1}, Lcom/google/firebase/auth/PhoneAuthOptions;->zzc()Lcom/google/firebase/auth/MultiFactorSession;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lcom/google/firebase/auth/internal/zzal;

    .line 26
    invoke-virtual {v4}, Lcom/google/firebase/auth/internal/zzal;->zzd()Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_5

    .line 27
    iget-object v1, v0, Lcom/google/firebase/auth/zzk;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    invoke-static {v1}, Lcom/google/firebase/auth/FirebaseAuth;->zzc(Lcom/google/firebase/auth/FirebaseAuth;)Lcom/google/android/gms/internal/firebase-auth-api/zzaai;

    move-result-object v1

    iget-object v5, v0, Lcom/google/firebase/auth/zzk;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 28
    invoke-virtual {v5}, Lcom/google/firebase/auth/PhoneAuthOptions;->zzh()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iget-object v6, v0, Lcom/google/firebase/auth/zzk;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    invoke-static {v6}, Lcom/google/firebase/auth/FirebaseAuth;->zze(Lcom/google/firebase/auth/FirebaseAuth;)Ljava/lang/String;

    move-result-object v6

    iget-object v9, v0, Lcom/google/firebase/auth/zzk;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 29
    invoke-virtual {v9}, Lcom/google/firebase/auth/PhoneAuthOptions;->zzd()Lcom/google/firebase/auth/PhoneAuthProvider$ForceResendingToken;

    move-result-object v9

    if-eqz v9, :cond_4

    const/4 v9, 0x1

    goto :goto_1

    :cond_4
    const/4 v9, 0x0

    :goto_1
    iget-object v2, v0, Lcom/google/firebase/auth/zzk;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 30
    invoke-virtual {v2}, Lcom/google/firebase/auth/PhoneAuthOptions;->zzk()Z

    move-result v10

    iget-object v2, v0, Lcom/google/firebase/auth/zzk;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    .line 31
    invoke-virtual {v2}, Lcom/google/firebase/auth/FirebaseAuth;->zzi()Z

    move-result v13

    iget-object v2, v0, Lcom/google/firebase/auth/zzk;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 32
    invoke-virtual {v2}, Lcom/google/firebase/auth/PhoneAuthOptions;->zzi()Ljava/util/concurrent/Executor;

    move-result-object v15

    iget-object v2, v0, Lcom/google/firebase/auth/zzk;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 33
    invoke-virtual {v2}, Lcom/google/firebase/auth/PhoneAuthOptions;->zza()Landroid/app/Activity;

    move-result-object v16

    move-object v3, v1

    .line 34
    invoke-virtual/range {v3 .. v16}, Lcom/google/android/gms/internal/firebase-auth-api/zzaai;->zza(Lcom/google/firebase/auth/internal/zzal;Ljava/lang/String;Ljava/lang/String;JZZLjava/lang/String;Ljava/lang/String;ZLcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;Ljava/util/concurrent/Executor;Landroid/app/Activity;)Lcom/google/android/gms/tasks/Task;

    return-void

    .line 35
    :cond_5
    iget-object v1, v0, Lcom/google/firebase/auth/zzk;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    invoke-static {v1}, Lcom/google/firebase/auth/FirebaseAuth;->zzc(Lcom/google/firebase/auth/FirebaseAuth;)Lcom/google/android/gms/internal/firebase-auth-api/zzaai;

    move-result-object v1

    iget-object v5, v0, Lcom/google/firebase/auth/zzk;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 36
    invoke-virtual {v5}, Lcom/google/firebase/auth/PhoneAuthOptions;->zzf()Lcom/google/firebase/auth/PhoneMultiFactorInfo;

    move-result-object v5

    invoke-static {v5}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/firebase/auth/PhoneMultiFactorInfo;

    iget-object v6, v0, Lcom/google/firebase/auth/zzk;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    invoke-static {v6}, Lcom/google/firebase/auth/FirebaseAuth;->zze(Lcom/google/firebase/auth/FirebaseAuth;)Ljava/lang/String;

    move-result-object v6

    iget-object v9, v0, Lcom/google/firebase/auth/zzk;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 37
    invoke-virtual {v9}, Lcom/google/firebase/auth/PhoneAuthOptions;->zzd()Lcom/google/firebase/auth/PhoneAuthProvider$ForceResendingToken;

    move-result-object v9

    if-eqz v9, :cond_6

    const/4 v9, 0x1

    goto :goto_2

    :cond_6
    const/4 v9, 0x0

    :goto_2
    iget-object v2, v0, Lcom/google/firebase/auth/zzk;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 38
    invoke-virtual {v2}, Lcom/google/firebase/auth/PhoneAuthOptions;->zzk()Z

    move-result v10

    iget-object v2, v0, Lcom/google/firebase/auth/zzk;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    .line 39
    invoke-virtual {v2}, Lcom/google/firebase/auth/FirebaseAuth;->zzi()Z

    move-result v13

    iget-object v2, v0, Lcom/google/firebase/auth/zzk;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 40
    invoke-virtual {v2}, Lcom/google/firebase/auth/PhoneAuthOptions;->zzi()Ljava/util/concurrent/Executor;

    move-result-object v15

    iget-object v2, v0, Lcom/google/firebase/auth/zzk;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 41
    invoke-virtual {v2}, Lcom/google/firebase/auth/PhoneAuthOptions;->zza()Landroid/app/Activity;

    move-result-object v16

    move-object v3, v1

    .line 42
    invoke-virtual/range {v3 .. v16}, Lcom/google/android/gms/internal/firebase-auth-api/zzaai;->zza(Lcom/google/firebase/auth/internal/zzal;Lcom/google/firebase/auth/PhoneMultiFactorInfo;Ljava/lang/String;JZZLjava/lang/String;Ljava/lang/String;ZLcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;Ljava/util/concurrent/Executor;Landroid/app/Activity;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method
