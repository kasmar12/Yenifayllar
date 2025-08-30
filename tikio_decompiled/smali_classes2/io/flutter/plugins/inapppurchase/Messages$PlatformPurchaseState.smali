.class public final enum Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;
.super Ljava/lang/Enum;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PlatformPurchaseState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

.field public static final enum PENDING:Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

.field public static final enum PURCHASED:Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

.field public static final enum UNSPECIFIED:Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;


# instance fields
.field final index:I


# direct methods
.method private static synthetic $values()[Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

    .line 107
    sget-object v1, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;->UNSPECIFIED:Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;->PURCHASED:Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;->PENDING:Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 108
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

    const-string v1, "UNSPECIFIED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;->UNSPECIFIED:Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

    .line 109
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

    const-string v1, "PURCHASED"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;->PURCHASED:Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

    .line 110
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

    const-string v1, "PENDING"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;->PENDING:Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

    .line 107
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;->$values()[Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

    move-result-object v0

    sput-object v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;->$VALUES:[Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 114
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 115
    iput p3, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;->index:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;
    .locals 1

    .line 107
    const-class v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

    return-object p0
.end method

.method public static values()[Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;
    .locals 1

    .line 107
    sget-object v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;->$VALUES:[Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

    invoke-virtual {v0}, [Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/flutter/plugins/inapppurchase/Messages$PlatformPurchaseState;

    return-object v0
.end method
