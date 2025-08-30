.class public final enum Lio/flutter/plugins/googlesignin/Messages$SignInType;
.super Ljava/lang/Enum;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/googlesignin/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SignInType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/flutter/plugins/googlesignin/Messages$SignInType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/flutter/plugins/googlesignin/Messages$SignInType;

.field public static final enum GAMES:Lio/flutter/plugins/googlesignin/Messages$SignInType;

.field public static final enum STANDARD:Lio/flutter/plugins/googlesignin/Messages$SignInType;


# instance fields
.field final index:I


# direct methods
.method private static synthetic $values()[Lio/flutter/plugins/googlesignin/Messages$SignInType;
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Lio/flutter/plugins/googlesignin/Messages$SignInType;

    .line 59
    sget-object v1, Lio/flutter/plugins/googlesignin/Messages$SignInType;->STANDARD:Lio/flutter/plugins/googlesignin/Messages$SignInType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/googlesignin/Messages$SignInType;->GAMES:Lio/flutter/plugins/googlesignin/Messages$SignInType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 61
    new-instance v0, Lio/flutter/plugins/googlesignin/Messages$SignInType;

    const-string v1, "STANDARD"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/googlesignin/Messages$SignInType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/googlesignin/Messages$SignInType;->STANDARD:Lio/flutter/plugins/googlesignin/Messages$SignInType;

    .line 63
    new-instance v0, Lio/flutter/plugins/googlesignin/Messages$SignInType;

    const-string v1, "GAMES"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/googlesignin/Messages$SignInType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/googlesignin/Messages$SignInType;->GAMES:Lio/flutter/plugins/googlesignin/Messages$SignInType;

    .line 59
    invoke-static {}, Lio/flutter/plugins/googlesignin/Messages$SignInType;->$values()[Lio/flutter/plugins/googlesignin/Messages$SignInType;

    move-result-object v0

    sput-object v0, Lio/flutter/plugins/googlesignin/Messages$SignInType;->$VALUES:[Lio/flutter/plugins/googlesignin/Messages$SignInType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 67
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 68
    iput p3, p0, Lio/flutter/plugins/googlesignin/Messages$SignInType;->index:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/flutter/plugins/googlesignin/Messages$SignInType;
    .locals 1

    .line 59
    const-class v0, Lio/flutter/plugins/googlesignin/Messages$SignInType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/flutter/plugins/googlesignin/Messages$SignInType;

    return-object p0
.end method

.method public static values()[Lio/flutter/plugins/googlesignin/Messages$SignInType;
    .locals 1

    .line 59
    sget-object v0, Lio/flutter/plugins/googlesignin/Messages$SignInType;->$VALUES:[Lio/flutter/plugins/googlesignin/Messages$SignInType;

    invoke-virtual {v0}, [Lio/flutter/plugins/googlesignin/Messages$SignInType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/flutter/plugins/googlesignin/Messages$SignInType;

    return-object v0
.end method
