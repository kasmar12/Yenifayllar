.class public final Lcom/google/firebase/auth/internal/zzac;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.3.0"

# interfaces
.implements Lcom/google/firebase/auth/FirebaseUserMetadata;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/firebase/auth/internal/zzac;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private zza:J

.field private zzb:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 17
    new-instance v0, Lcom/google/firebase/auth/internal/zzaf;

    invoke-direct {v0}, Lcom/google/firebase/auth/internal/zzaf;-><init>()V

    sput-object v0, Lcom/google/firebase/auth/internal/zzac;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(JJ)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-wide p1, p0, Lcom/google/firebase/auth/internal/zzac;->zza:J

    .line 20
    iput-wide p3, p0, Lcom/google/firebase/auth/internal/zzac;->zzb:J

    return-void
.end method

.method public static zza(Lorg/json/JSONObject;)Lcom/google/firebase/auth/internal/zzac;
    .locals 5

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    :try_start_0
    const-string v1, "lastSignInTimestamp"

    .line 6
    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v1

    const-string v3, "creationTimestamp"

    .line 7
    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v3

    .line 8
    new-instance p0, Lcom/google/firebase/auth/internal/zzac;

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/google/firebase/auth/internal/zzac;-><init>(JJ)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    return-object v0
.end method


# virtual methods
.method public final describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public final getCreationTimestamp()J
    .locals 2

    .line 2
    iget-wide v0, p0, Lcom/google/firebase/auth/internal/zzac;->zzb:J

    return-wide v0
.end method

.method public final getLastSignInTimestamp()J
    .locals 2

    .line 3
    iget-wide v0, p0, Lcom/google/firebase/auth/internal/zzac;->zza:J

    return-wide v0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 3

    .line 23
    invoke-static {p1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->beginObjectHeader(Landroid/os/Parcel;)I

    move-result p2

    .line 25
    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/zzac;->getLastSignInTimestamp()J

    move-result-wide v0

    const/4 v2, 0x1

    .line 26
    invoke-static {p1, v2, v0, v1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeLong(Landroid/os/Parcel;IJ)V

    .line 28
    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/zzac;->getCreationTimestamp()J

    move-result-wide v0

    const/4 v2, 0x2

    .line 29
    invoke-static {p1, v2, v0, v1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeLong(Landroid/os/Parcel;IJ)V

    .line 30
    invoke-static {p1, p2}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->finishObjectHeader(Landroid/os/Parcel;I)V

    return-void
.end method

.method public final zza()Lorg/json/JSONObject;
    .locals 4

    .line 11
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v1, "lastSignInTimestamp"

    .line 12
    iget-wide v2, p0, Lcom/google/firebase/auth/internal/zzac;->zza:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v1, "creationTimestamp"

    .line 13
    iget-wide v2, p0, Lcom/google/firebase/auth/internal/zzac;->zzb:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-object v0
.end method
