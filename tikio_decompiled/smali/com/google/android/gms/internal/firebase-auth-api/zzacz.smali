.class final Lcom/google/android/gms/internal/firebase-auth-api/zzacz;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.3.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzace;


# instance fields
.field final synthetic zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzacx;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final zza(Lcom/google/android/gms/common/api/Status;Lcom/google/firebase/auth/AuthCredential;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 4
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzacx;Lcom/google/android/gms/common/api/Status;)V

    .line 5
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iput-object p2, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zzp:Lcom/google/firebase/auth/AuthCredential;

    .line 6
    iget-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iput-object p3, p2, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zzq:Ljava/lang/String;

    .line 7
    iget-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iput-object p4, p2, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zzr:Ljava/lang/String;

    .line 8
    iget-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget-object p2, p2, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zzf:Lcom/google/firebase/auth/internal/zzat;

    if-eqz p2, :cond_0

    .line 9
    iget-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget-object p2, p2, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zzf:Lcom/google/firebase/auth/internal/zzat;

    invoke-interface {p2, p1}, Lcom/google/firebase/auth/internal/zzat;->zza(Lcom/google/android/gms/common/api/Status;)V

    .line 10
    :cond_0
    iget-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    invoke-virtual {p2, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza(Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method

.method private final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzadf;)V
    .locals 2

    .line 2
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget-object v0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zzi:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzadc;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzadc;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzacz;Lcom/google/android/gms/internal/firebase-auth-api/zzadf;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public final zza()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 26
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v1, v1, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unexpected response type "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 27
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzacx;)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/common/api/Status;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 46
    invoke-virtual {p1}, Lcom/google/android/gms/common/api/Status;->getStatusMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_9

    const-string v1, "MISSING_MFA_PENDING_CREDENTIAL"

    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 49
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    const/16 v0, 0x42b9

    invoke-direct {p1, v0}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    goto/16 :goto_0

    :cond_0
    const-string v1, "MISSING_MFA_ENROLLMENT_ID"

    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 51
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    const/16 v0, 0x42ba

    invoke-direct {p1, v0}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    goto/16 :goto_0

    :cond_1
    const-string v1, "INVALID_MFA_PENDING_CREDENTIAL"

    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 53
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    const/16 v0, 0x42bb

    invoke-direct {p1, v0}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    goto/16 :goto_0

    :cond_2
    const-string v1, "MFA_ENROLLMENT_NOT_FOUND"

    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 55
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    const/16 v0, 0x42bc

    invoke-direct {p1, v0}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    goto :goto_0

    :cond_3
    const-string v1, "ADMIN_ONLY_OPERATION"

    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 57
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    const/16 v0, 0x42bd

    invoke-direct {p1, v0}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    goto :goto_0

    :cond_4
    const-string v1, "UNVERIFIED_EMAIL"

    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 59
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    const/16 v0, 0x42be

    invoke-direct {p1, v0}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    goto :goto_0

    :cond_5
    const-string v1, "SECOND_FACTOR_EXISTS"

    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 61
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    const/16 v0, 0x42bf

    invoke-direct {p1, v0}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    goto :goto_0

    :cond_6
    const-string v1, "SECOND_FACTOR_LIMIT_EXCEEDED"

    .line 62
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 63
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    const/16 v0, 0x42c0

    invoke-direct {p1, v0}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    goto :goto_0

    :cond_7
    const-string v1, "UNSUPPORTED_FIRST_FACTOR"

    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 65
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    const/16 v0, 0x42c1

    invoke-direct {p1, v0}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    goto :goto_0

    :cond_8
    const-string v1, "EMAIL_CHANGE_NEEDS_VERIFICATION"

    .line 66
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 67
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    const/16 v0, 0x42c2

    invoke-direct {p1, v0}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    .line 70
    :cond_9
    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_a

    .line 71
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzacx;Z)V

    .line 72
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zzx:Z

    .line 73
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzadd;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzadd;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzacz;Lcom/google/android/gms/common/api/Status;)V

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzadf;)V

    return-void

    .line 74
    :cond_a
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzacx;Lcom/google/android/gms/common/api/Status;)V

    .line 75
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza(Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/common/api/Status;Lcom/google/firebase/auth/PhoneAuthCredential;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 41
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v1, v1, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unexpected response type "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    const/4 v0, 0x0

    .line 43
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza(Lcom/google/android/gms/common/api/Status;Lcom/google/firebase/auth/AuthCredential;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzaen;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 22
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v1, v1, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unexpected response type "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 23
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iput-object p1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zzl:Lcom/google/android/gms/internal/firebase-auth-api/zzaen;

    .line 24
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzacx;)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzafj;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 77
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iput-object p1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zzu:Lcom/google/android/gms/internal/firebase-auth-api/zzafj;

    .line 78
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzacx;)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzafk;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 80
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iput-object p1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zzt:Lcom/google/android/gms/internal/firebase-auth-api/zzafk;

    .line 81
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzacx;)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzafn;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 108
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unexpected response type: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 109
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iput-object p1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zzj:Lcom/google/android/gms/internal/firebase-auth-api/zzafn;

    .line 110
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzacx;)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzafn;Lcom/google/android/gms/internal/firebase-auth-api/zzafc;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 83
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v1, v1, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unexpected response type: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 84
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iput-object p1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zzj:Lcom/google/android/gms/internal/firebase-auth-api/zzafn;

    .line 85
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iput-object p2, p1, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zzk:Lcom/google/android/gms/internal/firebase-auth-api/zzafc;

    .line 86
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzacx;)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzafw;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 88
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v1, v1, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unexpected response type "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 89
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iput-object p1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zzm:Lcom/google/android/gms/internal/firebase-auth-api/zzafw;

    .line 90
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzacx;)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzagb;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 92
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iput-object p1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zzw:Lcom/google/android/gms/internal/firebase-auth-api/zzagb;

    .line 93
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzacx;)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzagj;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 105
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iput-object p1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zzv:Lcom/google/android/gms/internal/firebase-auth-api/zzagj;

    .line 106
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzacx;)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzyh;)V
    .locals 3

    .line 30
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zza()Lcom/google/android/gms/common/api/Status;

    move-result-object v0

    .line 31
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzb()Lcom/google/firebase/auth/zzf;

    move-result-object v1

    .line 32
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzc()Ljava/lang/String;

    move-result-object v2

    .line 33
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzyh;->zzd()Ljava/lang/String;

    move-result-object p1

    .line 34
    invoke-direct {p0, v0, v1, v2, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza(Lcom/google/android/gms/common/api/Status;Lcom/google/firebase/auth/AuthCredential;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzyk;)V
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iput-object p1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zzs:Lcom/google/android/gms/internal/firebase-auth-api/zzyk;

    .line 37
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    const-string v0, "REQUIRES_SECOND_FACTOR_AUTH"

    .line 38
    invoke-static {v0}, Lcom/google/firebase/auth/internal/zzan;->zza(Ljava/lang/String;)Lcom/google/android/gms/common/api/Status;

    move-result-object v0

    .line 39
    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza(Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method

.method public final zza(Lcom/google/firebase/auth/PhoneAuthCredential;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 112
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    const/4 v1, 0x1

    const/16 v2, 0x8

    if-ne v0, v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v2, v2, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Unexpected response type "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 113
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzacx;Z)V

    .line 114
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iput-boolean v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zzx:Z

    .line 115
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzadb;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzadb;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzacz;Lcom/google/firebase/auth/PhoneAuthCredential;)V

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzadf;)V

    return-void
.end method

.method public final zza(Ljava/lang/String;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 12
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    const/4 v1, 0x1

    const/16 v2, 0x8

    if-ne v0, v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v2, v2, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Unexpected response type "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 13
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iput-object p1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zzo:Ljava/lang/String;

    .line 14
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzacx;Z)V

    .line 15
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iput-boolean v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zzx:Z

    .line 16
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzada;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzada;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzacz;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzadf;)V

    return-void
.end method

.method public final zzb()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 95
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v1, v1, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unexpected response type "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 96
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzacx;)V

    return-void
.end method

.method public final zzb(Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 18
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v1, v1, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unexpected response type "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 19
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iput-object p1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zzo:Ljava/lang/String;

    .line 20
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacy;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacy;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzacz;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzadf;)V

    return-void
.end method

.method public final zzc()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 102
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    const/16 v1, 0x9

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v1, v1, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unexpected response type "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 103
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzacx;)V

    return-void
.end method

.method public final zzc(Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 98
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    const/4 v1, 0x7

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iget v1, v1, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza:I

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unexpected response type "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 99
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    iput-object p1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zzn:Ljava/lang/String;

    .line 100
    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzacz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacx;

    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacx;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzacx;)V

    return-void
.end method
