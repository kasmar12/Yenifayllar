.class public final Lcom/google/firebase/auth/internal/zzbw;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.3.0"


# instance fields
.field private volatile zza:I

.field private final zzb:Lcom/google/firebase/auth/internal/zzap;

.field private volatile zzc:Z


# direct methods
.method private constructor <init>(Landroid/content/Context;Lcom/google/firebase/auth/internal/zzap;)V
    .locals 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Lcom/google/firebase/auth/internal/zzbw;->zzc:Z

    .line 5
    iput v0, p0, Lcom/google/firebase/auth/internal/zzbw;->zza:I

    .line 6
    iput-object p2, p0, Lcom/google/firebase/auth/internal/zzbw;->zzb:Lcom/google/firebase/auth/internal/zzap;

    .line 7
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Landroid/app/Application;

    invoke-static {p1}, Lcom/google/android/gms/common/api/internal/BackgroundDetector;->initialize(Landroid/app/Application;)V

    .line 8
    invoke-static {}, Lcom/google/android/gms/common/api/internal/BackgroundDetector;->getInstance()Lcom/google/android/gms/common/api/internal/BackgroundDetector;

    move-result-object p1

    new-instance p2, Lcom/google/firebase/auth/internal/zzbz;

    invoke-direct {p2, p0}, Lcom/google/firebase/auth/internal/zzbz;-><init>(Lcom/google/firebase/auth/internal/zzbw;)V

    .line 9
    invoke-virtual {p1, p2}, Lcom/google/android/gms/common/api/internal/BackgroundDetector;->addListener(Lcom/google/android/gms/common/api/internal/BackgroundDetector$BackgroundStateChangeListener;)V

    return-void
.end method

.method public constructor <init>(Lcom/google/firebase/FirebaseApp;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/firebase/FirebaseApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lcom/google/firebase/auth/internal/zzap;

    invoke-direct {v1, p1}, Lcom/google/firebase/auth/internal/zzap;-><init>(Lcom/google/firebase/FirebaseApp;)V

    invoke-direct {p0, v0, v1}, Lcom/google/firebase/auth/internal/zzbw;-><init>(Landroid/content/Context;Lcom/google/firebase/auth/internal/zzap;)V

    return-void
.end method

.method static bridge synthetic zza(Lcom/google/firebase/auth/internal/zzbw;)Lcom/google/firebase/auth/internal/zzap;
    .locals 0

    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzbw;->zzb:Lcom/google/firebase/auth/internal/zzap;

    return-object p0
.end method

.method static bridge synthetic zza(Lcom/google/firebase/auth/internal/zzbw;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/google/firebase/auth/internal/zzbw;->zzc:Z

    return-void
.end method

.method private final zzb()Z
    .locals 1

    .line 34
    iget v0, p0, Lcom/google/firebase/auth/internal/zzbw;->zza:I

    if-lez v0, :cond_0

    iget-boolean v0, p0, Lcom/google/firebase/auth/internal/zzbw;->zzc:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method static bridge synthetic zzb(Lcom/google/firebase/auth/internal/zzbw;)Z
    .locals 0

    invoke-direct {p0}, Lcom/google/firebase/auth/internal/zzbw;->zzb()Z

    move-result p0

    return p0
.end method


# virtual methods
.method public final zza()V
    .locals 1

    .line 11
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzbw;->zzb:Lcom/google/firebase/auth/internal/zzap;

    invoke-virtual {v0}, Lcom/google/firebase/auth/internal/zzap;->zzb()V

    return-void
.end method

.method public final zza(I)V
    .locals 1

    if-lez p1, :cond_0

    .line 13
    iget v0, p0, Lcom/google/firebase/auth/internal/zzbw;->zza:I

    if-nez v0, :cond_0

    .line 14
    iput p1, p0, Lcom/google/firebase/auth/internal/zzbw;->zza:I

    .line 15
    invoke-direct {p0}, Lcom/google/firebase/auth/internal/zzbw;->zzb()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 16
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzbw;->zzb:Lcom/google/firebase/auth/internal/zzap;

    invoke-virtual {v0}, Lcom/google/firebase/auth/internal/zzap;->zzc()V

    goto :goto_0

    :cond_0
    if-nez p1, :cond_1

    .line 17
    iget v0, p0, Lcom/google/firebase/auth/internal/zzbw;->zza:I

    if-eqz v0, :cond_1

    .line 19
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzbw;->zzb:Lcom/google/firebase/auth/internal/zzap;

    invoke-virtual {v0}, Lcom/google/firebase/auth/internal/zzap;->zzb()V

    .line 20
    :cond_1
    :goto_0
    iput p1, p0, Lcom/google/firebase/auth/internal/zzbw;->zza:I

    return-void
.end method

.method public final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzafn;)V
    .locals 6

    if-nez p1, :cond_0

    return-void

    .line 24
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafn;->zza()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gtz v4, :cond_1

    const-wide/16 v0, 0xe10

    .line 27
    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzafn;->zzb()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    mul-long v0, v0, v4

    add-long/2addr v2, v0

    .line 28
    iget-object p1, p0, Lcom/google/firebase/auth/internal/zzbw;->zzb:Lcom/google/firebase/auth/internal/zzap;

    .line 29
    iput-wide v2, p1, Lcom/google/firebase/auth/internal/zzap;->zza:J

    const-wide/16 v0, -0x1

    .line 30
    iput-wide v0, p1, Lcom/google/firebase/auth/internal/zzap;->zzb:J

    .line 31
    invoke-direct {p0}, Lcom/google/firebase/auth/internal/zzbw;->zzb()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 32
    iget-object p1, p0, Lcom/google/firebase/auth/internal/zzbw;->zzb:Lcom/google/firebase/auth/internal/zzap;

    invoke-virtual {p1}, Lcom/google/firebase/auth/internal/zzap;->zzc()V

    :cond_2
    return-void
.end method
