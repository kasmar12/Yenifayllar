.class public final enum Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;
.super Ljava/lang/Enum;
.source "GeneratedAndroidFirebaseAuth.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ActionCodeInfoOperation"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

.field public static final enum EMAIL_SIGN_IN:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

.field public static final enum PASSWORD_RESET:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

.field public static final enum RECOVER_EMAIL:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

.field public static final enum REVERT_SECOND_FACTOR_ADDITION:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

.field public static final enum UNKNOWN:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

.field public static final enum VERIFY_AND_CHANGE_EMAIL:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

.field public static final enum VERIFY_EMAIL:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;


# instance fields
.field final index:I


# direct methods
.method private static synthetic $values()[Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;
    .locals 3

    const/4 v0, 0x7

    new-array v0, v0, [Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    .line 60
    sget-object v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->UNKNOWN:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->PASSWORD_RESET:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->VERIFY_EMAIL:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->RECOVER_EMAIL:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->EMAIL_SIGN_IN:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->VERIFY_AND_CHANGE_EMAIL:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->REVERT_SECOND_FACTOR_ADDITION:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 62
    new-instance v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    const-string v1, "UNKNOWN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->UNKNOWN:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    .line 64
    new-instance v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    const-string v1, "PASSWORD_RESET"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->PASSWORD_RESET:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    .line 66
    new-instance v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    const-string v1, "VERIFY_EMAIL"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->VERIFY_EMAIL:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    .line 68
    new-instance v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    const-string v1, "RECOVER_EMAIL"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->RECOVER_EMAIL:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    .line 70
    new-instance v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    const-string v1, "EMAIL_SIGN_IN"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->EMAIL_SIGN_IN:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    .line 72
    new-instance v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    const-string v1, "VERIFY_AND_CHANGE_EMAIL"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->VERIFY_AND_CHANGE_EMAIL:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    .line 74
    new-instance v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    const-string v1, "REVERT_SECOND_FACTOR_ADDITION"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->REVERT_SECOND_FACTOR_ADDITION:Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    .line 60
    invoke-static {}, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->$values()[Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    move-result-object v0

    sput-object v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->$VALUES:[Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 78
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 79
    iput p3, p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->index:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;
    .locals 1

    .line 60
    const-class v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    return-object p0
.end method

.method public static values()[Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;
    .locals 1

    .line 60
    sget-object v0, Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->$VALUES:[Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    invoke-virtual {v0}, [Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/flutter/plugins/firebase/auth/GeneratedAndroidFirebaseAuth$ActionCodeInfoOperation;

    return-object v0
.end method
