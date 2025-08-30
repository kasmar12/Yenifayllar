.class public final enum Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;
.super Ljava/lang/Enum;
.source "GeneratedAndroidFirebaseFirestore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ServerTimestampBehavior"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;

.field public static final enum ESTIMATE:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;

.field public static final enum NONE:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;

.field public static final enum PREVIOUS:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;


# instance fields
.field final index:I


# direct methods
.method private static synthetic $values()[Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;

    .line 107
    sget-object v1, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;->NONE:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;->ESTIMATE:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;->PREVIOUS:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 109
    new-instance v0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;->NONE:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;

    .line 114
    new-instance v0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;

    const-string v1, "ESTIMATE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;->ESTIMATE:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;

    .line 119
    new-instance v0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;

    const-string v1, "PREVIOUS"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;->PREVIOUS:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;

    .line 107
    invoke-static {}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;->$values()[Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;

    move-result-object v0

    sput-object v0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;->$VALUES:[Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 123
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 124
    iput p3, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;->index:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;
    .locals 1

    .line 107
    const-class v0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;

    return-object p0
.end method

.method public static values()[Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;
    .locals 1

    .line 107
    sget-object v0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;->$VALUES:[Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;

    invoke-virtual {v0}, [Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;

    return-object v0
.end method
