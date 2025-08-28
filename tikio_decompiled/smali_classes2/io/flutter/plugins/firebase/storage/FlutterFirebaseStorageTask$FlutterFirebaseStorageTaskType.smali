.class final enum Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;
.super Ljava/lang/Enum;
.source "FlutterFirebaseStorageTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "FlutterFirebaseStorageTaskType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

.field public static final enum BYTES:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

.field public static final enum DOWNLOAD:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

.field public static final enum FILE:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;


# direct methods
.method private static synthetic $values()[Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    .line 211
    sget-object v1, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;->FILE:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;->BYTES:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;->DOWNLOAD:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 212
    new-instance v0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    const-string v1, "FILE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;->FILE:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    .line 213
    new-instance v0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    const-string v1, "BYTES"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;->BYTES:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    .line 214
    new-instance v0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    const-string v1, "DOWNLOAD"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;->DOWNLOAD:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    .line 211
    invoke-static {}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;->$values()[Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    move-result-object v0

    sput-object v0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;->$VALUES:[Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 211
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;
    .locals 1

    .line 211
    const-class v0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    return-object p0
.end method

.method public static values()[Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;
    .locals 1

    .line 211
    sget-object v0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;->$VALUES:[Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    invoke-virtual {v0}, [Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    return-object v0
.end method
