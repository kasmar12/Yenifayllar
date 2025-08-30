.class public final enum Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;
.super Ljava/lang/Enum;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PlatformRecurrenceMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

.field public static final enum FINITE_RECURRING:Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

.field public static final enum INFINITE_RECURRING:Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

.field public static final enum NON_RECURRING:Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;


# instance fields
.field final index:I


# direct methods
.method private static synthetic $values()[Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    .line 120
    sget-object v1, Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;->FINITE_RECURRING:Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;->INFINITE_RECURRING:Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;->NON_RECURRING:Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 121
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    const-string v1, "FINITE_RECURRING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;->FINITE_RECURRING:Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    .line 122
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    const-string v1, "INFINITE_RECURRING"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;->INFINITE_RECURRING:Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    .line 123
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    const-string v1, "NON_RECURRING"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;->NON_RECURRING:Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    .line 120
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;->$values()[Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    move-result-object v0

    sput-object v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;->$VALUES:[Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 127
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 128
    iput p3, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;->index:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;
    .locals 1

    .line 120
    const-class v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    return-object p0
.end method

.method public static values()[Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;
    .locals 1

    .line 120
    sget-object v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;->$VALUES:[Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    invoke-virtual {v0}, [Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/flutter/plugins/inapppurchase/Messages$PlatformRecurrenceMode;

    return-object v0
.end method
