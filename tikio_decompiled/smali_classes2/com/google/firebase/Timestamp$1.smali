.class Lcom/google/firebase/Timestamp$1;
.super Ljava/lang/Object;
.source "Timestamp.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/Timestamp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/google/firebase/Timestamp;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/google/firebase/Timestamp;
    .locals 1

    .line 42
    new-instance v0, Lcom/google/firebase/Timestamp;

    invoke-direct {v0, p1}, Lcom/google/firebase/Timestamp;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 39
    invoke-virtual {p0, p1}, Lcom/google/firebase/Timestamp$1;->createFromParcel(Landroid/os/Parcel;)Lcom/google/firebase/Timestamp;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lcom/google/firebase/Timestamp;
    .locals 0

    .line 47
    new-array p1, p1, [Lcom/google/firebase/Timestamp;

    return-object p1
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 39
    invoke-virtual {p0, p1}, Lcom/google/firebase/Timestamp$1;->newArray(I)[Lcom/google/firebase/Timestamp;

    move-result-object p1

    return-object p1
.end method
