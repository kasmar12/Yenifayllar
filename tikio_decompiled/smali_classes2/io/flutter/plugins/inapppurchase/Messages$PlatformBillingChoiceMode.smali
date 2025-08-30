.class public final enum Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;
.super Ljava/lang/Enum;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PlatformBillingChoiceMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;

.field public static final enum ALTERNATIVE_BILLING_ONLY:Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;

.field public static final enum PLAY_BILLING_ONLY:Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;

.field public static final enum USER_CHOICE_BILLING:Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;


# instance fields
.field final index:I


# direct methods
.method private static synthetic $values()[Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;

    .line 87
    sget-object v1, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;->PLAY_BILLING_ONLY:Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;->ALTERNATIVE_BILLING_ONLY:Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;->USER_CHOICE_BILLING:Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 93
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;

    const-string v1, "PLAY_BILLING_ONLY"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;->PLAY_BILLING_ONLY:Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;

    .line 95
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;

    const-string v1, "ALTERNATIVE_BILLING_ONLY"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;->ALTERNATIVE_BILLING_ONLY:Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;

    .line 97
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;

    const-string v1, "USER_CHOICE_BILLING"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;->USER_CHOICE_BILLING:Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;

    .line 87
    invoke-static {}, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;->$values()[Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;

    move-result-object v0

    sput-object v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;->$VALUES:[Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 101
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 102
    iput p3, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;->index:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;
    .locals 1

    .line 87
    const-class v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;

    return-object p0
.end method

.method public static values()[Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;
    .locals 1

    .line 87
    sget-object v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;->$VALUES:[Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;

    invoke-virtual {v0}, [Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/flutter/plugins/inapppurchase/Messages$PlatformBillingChoiceMode;

    return-object v0
.end method
