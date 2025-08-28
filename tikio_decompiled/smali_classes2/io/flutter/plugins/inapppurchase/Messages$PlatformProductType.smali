.class public final enum Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;
.super Ljava/lang/Enum;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PlatformProductType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

.field public static final enum INAPP:Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

.field public static final enum SUBS:Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;


# instance fields
.field final index:I


# direct methods
.method private static synthetic $values()[Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    .line 75
    sget-object v1, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;->INAPP:Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;->SUBS:Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 76
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    const-string v1, "INAPP"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;->INAPP:Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    .line 77
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    const-string v1, "SUBS"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;->SUBS:Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    .line 75
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;->$values()[Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    move-result-object v0

    sput-object v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;->$VALUES:[Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 81
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 82
    iput p3, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;->index:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;
    .locals 1

    .line 75
    const-class v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    return-object p0
.end method

.method public static values()[Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;
    .locals 1

    .line 75
    sget-object v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;->$VALUES:[Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    invoke-virtual {v0}, [Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    return-object v0
.end method
