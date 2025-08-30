.class final Lcom/google/android/gms/internal/firebase-auth-api/zzady;
.super Landroid/content/BroadcastReceiver;
.source "com.google.firebase:firebase-auth@@22.3.0"


# instance fields
.field private final zza:Ljava/lang/String;

.field private final synthetic zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzadu;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzadu;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzady;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzadu;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzady;->zza:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .line 4
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.google.android.gms.auth.api.phone.SMS_RETRIEVED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 5
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p2

    const-string v0, "com.google.android.gms.auth.api.phone.EXTRA_STATUS"

    .line 6
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Status;

    .line 7
    invoke-virtual {v0}, Lcom/google/android/gms/common/api/Status;->getStatusCode()I

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "com.google.android.gms.auth.api.phone.EXTRA_SMS_MESSAGE"

    .line 8
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    .line 9
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzady;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzadu;

    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzadu;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzadu;)Ljava/util/HashMap;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzady;->zza:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaeb;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 11
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzadu;->zza()Lcom/google/android/gms/common/logging/Logger;

    move-result-object p2

    new-array v0, v1, [Ljava/lang/Object;

    const-string v1, "Verification code received with no active retrieval session."

    invoke-virtual {p2, v1, v0}, Lcom/google/android/gms/common/logging/Logger;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 13
    :cond_1
    invoke-static {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzadu;->zza(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaeb;->zze:Ljava/lang/String;

    .line 14
    iget-object p2, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaeb;->zze:Ljava/lang/String;

    if-nez p2, :cond_2

    .line 15
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzadu;->zza()Lcom/google/android/gms/common/logging/Logger;

    move-result-object p2

    new-array v0, v1, [Ljava/lang/Object;

    const-string v1, "Unable to extract verification code."

    invoke-virtual {p2, v1, v0}, Lcom/google/android/gms/common/logging/Logger;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 17
    :cond_2
    iget-object p2, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaeb;->zzd:Ljava/lang/String;

    invoke-static {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzag;->zzc(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_3

    .line 18
    iget-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzady;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzadu;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzady;->zza:Ljava/lang/String;

    invoke-static {p2, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzadu;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzadu;Ljava/lang/String;)V

    .line 19
    :cond_3
    :goto_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    :cond_4
    return-void
.end method
