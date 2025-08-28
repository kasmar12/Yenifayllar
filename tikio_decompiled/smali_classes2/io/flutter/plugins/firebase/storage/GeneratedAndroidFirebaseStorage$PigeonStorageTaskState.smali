.class public final enum Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;
.super Ljava/lang/Enum;
.source "GeneratedAndroidFirebaseStorage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PigeonStorageTaskState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

.field public static final enum CANCELED:Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

.field public static final enum ERROR:Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

.field public static final enum PAUSED:Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

.field public static final enum RUNNING:Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

.field public static final enum SUCCESS:Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;


# instance fields
.field final index:I


# direct methods
.method private static synthetic $values()[Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;
    .locals 3

    const/4 v0, 0x5

    new-array v0, v0, [Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    .line 60
    sget-object v1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->PAUSED:Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->RUNNING:Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->SUCCESS:Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->CANCELED:Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->ERROR:Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 62
    new-instance v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    const-string v1, "PAUSED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->PAUSED:Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    .line 64
    new-instance v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    const-string v1, "RUNNING"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->RUNNING:Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    .line 66
    new-instance v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    const-string v1, "SUCCESS"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->SUCCESS:Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    .line 68
    new-instance v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    const-string v1, "CANCELED"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->CANCELED:Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    .line 70
    new-instance v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    const-string v1, "ERROR"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->ERROR:Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    .line 60
    invoke-static {}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->$values()[Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    move-result-object v0

    sput-object v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->$VALUES:[Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 74
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 75
    iput p3, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->index:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;
    .locals 1

    .line 60
    const-class v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    return-object p0
.end method

.method public static values()[Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;
    .locals 1

    .line 60
    sget-object v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->$VALUES:[Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    invoke-virtual {v0}, [Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    return-object v0
.end method
