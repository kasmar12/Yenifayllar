.class public final synthetic Lcom/google/android/gms/internal/firebase-auth-api/zzadg;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.3.0"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic zza:Lcom/google/android/gms/internal/firebase-auth-api/zzadh;

.field private synthetic zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzadj;

.field private synthetic zzc:Lcom/google/android/gms/tasks/TaskCompletionSource;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzadh;Lcom/google/android/gms/internal/firebase-auth-api/zzadj;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzadg;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzadh;

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzadg;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzadj;

    iput-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzadg;->zzc:Lcom/google/android/gms/tasks/TaskCompletionSource;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzadg;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzadh;

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzadg;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzadj;

    iget-object v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzadg;->zzc:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 2
    iget-object v0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzadh;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzacg;

    invoke-interface {v1, v2, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzadj;->zza(Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/android/gms/internal/firebase-auth-api/zzacg;)V

    return-void
.end method
