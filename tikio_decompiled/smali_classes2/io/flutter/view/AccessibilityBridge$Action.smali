.class public final enum Lio/flutter/view/AccessibilityBridge$Action;
.super Ljava/lang/Enum;
.source "AccessibilityBridge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/view/AccessibilityBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Action"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/flutter/view/AccessibilityBridge$Action;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/flutter/view/AccessibilityBridge$Action;

.field public static final enum COPY:Lio/flutter/view/AccessibilityBridge$Action;

.field public static final enum CUSTOM_ACTION:Lio/flutter/view/AccessibilityBridge$Action;

.field public static final enum CUT:Lio/flutter/view/AccessibilityBridge$Action;

.field public static final enum DECREASE:Lio/flutter/view/AccessibilityBridge$Action;

.field public static final enum DID_GAIN_ACCESSIBILITY_FOCUS:Lio/flutter/view/AccessibilityBridge$Action;

.field public static final enum DID_LOSE_ACCESSIBILITY_FOCUS:Lio/flutter/view/AccessibilityBridge$Action;

.field public static final enum DISMISS:Lio/flutter/view/AccessibilityBridge$Action;

.field public static final enum INCREASE:Lio/flutter/view/AccessibilityBridge$Action;

.field public static final enum LONG_PRESS:Lio/flutter/view/AccessibilityBridge$Action;

.field public static final enum MOVE_CURSOR_BACKWARD_BY_CHARACTER:Lio/flutter/view/AccessibilityBridge$Action;

.field public static final enum MOVE_CURSOR_BACKWARD_BY_WORD:Lio/flutter/view/AccessibilityBridge$Action;

.field public static final enum MOVE_CURSOR_FORWARD_BY_CHARACTER:Lio/flutter/view/AccessibilityBridge$Action;

.field public static final enum MOVE_CURSOR_FORWARD_BY_WORD:Lio/flutter/view/AccessibilityBridge$Action;

.field public static final enum PASTE:Lio/flutter/view/AccessibilityBridge$Action;

.field public static final enum SCROLL_DOWN:Lio/flutter/view/AccessibilityBridge$Action;

.field public static final enum SCROLL_LEFT:Lio/flutter/view/AccessibilityBridge$Action;

.field public static final enum SCROLL_RIGHT:Lio/flutter/view/AccessibilityBridge$Action;

.field public static final enum SCROLL_UP:Lio/flutter/view/AccessibilityBridge$Action;

.field public static final enum SET_SELECTION:Lio/flutter/view/AccessibilityBridge$Action;

.field public static final enum SET_TEXT:Lio/flutter/view/AccessibilityBridge$Action;

.field public static final enum SHOW_ON_SCREEN:Lio/flutter/view/AccessibilityBridge$Action;

.field public static final enum TAP:Lio/flutter/view/AccessibilityBridge$Action;


# instance fields
.field public final value:I


# direct methods
.method private static synthetic $values()[Lio/flutter/view/AccessibilityBridge$Action;
    .locals 3

    const/16 v0, 0x16

    new-array v0, v0, [Lio/flutter/view/AccessibilityBridge$Action;

    .line 2083
    sget-object v1, Lio/flutter/view/AccessibilityBridge$Action;->TAP:Lio/flutter/view/AccessibilityBridge$Action;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Action;->LONG_PRESS:Lio/flutter/view/AccessibilityBridge$Action;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Action;->SCROLL_LEFT:Lio/flutter/view/AccessibilityBridge$Action;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Action;->SCROLL_RIGHT:Lio/flutter/view/AccessibilityBridge$Action;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Action;->SCROLL_UP:Lio/flutter/view/AccessibilityBridge$Action;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Action;->SCROLL_DOWN:Lio/flutter/view/AccessibilityBridge$Action;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Action;->INCREASE:Lio/flutter/view/AccessibilityBridge$Action;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Action;->DECREASE:Lio/flutter/view/AccessibilityBridge$Action;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Action;->SHOW_ON_SCREEN:Lio/flutter/view/AccessibilityBridge$Action;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Action;->MOVE_CURSOR_FORWARD_BY_CHARACTER:Lio/flutter/view/AccessibilityBridge$Action;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Action;->MOVE_CURSOR_BACKWARD_BY_CHARACTER:Lio/flutter/view/AccessibilityBridge$Action;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Action;->SET_SELECTION:Lio/flutter/view/AccessibilityBridge$Action;

    const/16 v2, 0xb

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Action;->COPY:Lio/flutter/view/AccessibilityBridge$Action;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Action;->CUT:Lio/flutter/view/AccessibilityBridge$Action;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Action;->PASTE:Lio/flutter/view/AccessibilityBridge$Action;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Action;->DID_GAIN_ACCESSIBILITY_FOCUS:Lio/flutter/view/AccessibilityBridge$Action;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Action;->DID_LOSE_ACCESSIBILITY_FOCUS:Lio/flutter/view/AccessibilityBridge$Action;

    const/16 v2, 0x10

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Action;->CUSTOM_ACTION:Lio/flutter/view/AccessibilityBridge$Action;

    const/16 v2, 0x11

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Action;->DISMISS:Lio/flutter/view/AccessibilityBridge$Action;

    const/16 v2, 0x12

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Action;->MOVE_CURSOR_FORWARD_BY_WORD:Lio/flutter/view/AccessibilityBridge$Action;

    const/16 v2, 0x13

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Action;->MOVE_CURSOR_BACKWARD_BY_WORD:Lio/flutter/view/AccessibilityBridge$Action;

    const/16 v2, 0x14

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/view/AccessibilityBridge$Action;->SET_TEXT:Lio/flutter/view/AccessibilityBridge$Action;

    const/16 v2, 0x15

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 6

    .line 2084
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Action;

    const-string v1, "TAP"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/view/AccessibilityBridge$Action;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Action;->TAP:Lio/flutter/view/AccessibilityBridge$Action;

    .line 2085
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Action;

    const-string v1, "LONG_PRESS"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v3, v2}, Lio/flutter/view/AccessibilityBridge$Action;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Action;->LONG_PRESS:Lio/flutter/view/AccessibilityBridge$Action;

    .line 2086
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Action;

    const-string v1, "SCROLL_LEFT"

    const/4 v3, 0x4

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/view/AccessibilityBridge$Action;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Action;->SCROLL_LEFT:Lio/flutter/view/AccessibilityBridge$Action;

    .line 2087
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Action;

    const-string v1, "SCROLL_RIGHT"

    const/4 v2, 0x3

    const/16 v4, 0x8

    invoke-direct {v0, v1, v2, v4}, Lio/flutter/view/AccessibilityBridge$Action;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Action;->SCROLL_RIGHT:Lio/flutter/view/AccessibilityBridge$Action;

    .line 2088
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Action;

    const-string v1, "SCROLL_UP"

    const/16 v2, 0x10

    invoke-direct {v0, v1, v3, v2}, Lio/flutter/view/AccessibilityBridge$Action;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Action;->SCROLL_UP:Lio/flutter/view/AccessibilityBridge$Action;

    .line 2089
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Action;

    const-string v1, "SCROLL_DOWN"

    const/4 v3, 0x5

    const/16 v5, 0x20

    invoke-direct {v0, v1, v3, v5}, Lio/flutter/view/AccessibilityBridge$Action;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Action;->SCROLL_DOWN:Lio/flutter/view/AccessibilityBridge$Action;

    .line 2090
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Action;

    const-string v1, "INCREASE"

    const/4 v3, 0x6

    const/16 v5, 0x40

    invoke-direct {v0, v1, v3, v5}, Lio/flutter/view/AccessibilityBridge$Action;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Action;->INCREASE:Lio/flutter/view/AccessibilityBridge$Action;

    .line 2091
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Action;

    const-string v1, "DECREASE"

    const/4 v3, 0x7

    const/16 v5, 0x80

    invoke-direct {v0, v1, v3, v5}, Lio/flutter/view/AccessibilityBridge$Action;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Action;->DECREASE:Lio/flutter/view/AccessibilityBridge$Action;

    .line 2092
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Action;

    const-string v1, "SHOW_ON_SCREEN"

    const/16 v3, 0x100

    invoke-direct {v0, v1, v4, v3}, Lio/flutter/view/AccessibilityBridge$Action;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Action;->SHOW_ON_SCREEN:Lio/flutter/view/AccessibilityBridge$Action;

    .line 2093
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Action;

    const-string v1, "MOVE_CURSOR_FORWARD_BY_CHARACTER"

    const/16 v3, 0x9

    const/16 v4, 0x200

    invoke-direct {v0, v1, v3, v4}, Lio/flutter/view/AccessibilityBridge$Action;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Action;->MOVE_CURSOR_FORWARD_BY_CHARACTER:Lio/flutter/view/AccessibilityBridge$Action;

    .line 2094
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Action;

    const-string v1, "MOVE_CURSOR_BACKWARD_BY_CHARACTER"

    const/16 v3, 0xa

    const/16 v4, 0x400

    invoke-direct {v0, v1, v3, v4}, Lio/flutter/view/AccessibilityBridge$Action;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Action;->MOVE_CURSOR_BACKWARD_BY_CHARACTER:Lio/flutter/view/AccessibilityBridge$Action;

    .line 2095
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Action;

    const-string v1, "SET_SELECTION"

    const/16 v3, 0xb

    const/16 v4, 0x800

    invoke-direct {v0, v1, v3, v4}, Lio/flutter/view/AccessibilityBridge$Action;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Action;->SET_SELECTION:Lio/flutter/view/AccessibilityBridge$Action;

    .line 2096
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Action;

    const-string v1, "COPY"

    const/16 v3, 0xc

    const/16 v4, 0x1000

    invoke-direct {v0, v1, v3, v4}, Lio/flutter/view/AccessibilityBridge$Action;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Action;->COPY:Lio/flutter/view/AccessibilityBridge$Action;

    .line 2097
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Action;

    const-string v1, "CUT"

    const/16 v3, 0xd

    const/16 v4, 0x2000

    invoke-direct {v0, v1, v3, v4}, Lio/flutter/view/AccessibilityBridge$Action;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Action;->CUT:Lio/flutter/view/AccessibilityBridge$Action;

    .line 2098
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Action;

    const-string v1, "PASTE"

    const/16 v3, 0xe

    const/16 v4, 0x4000

    invoke-direct {v0, v1, v3, v4}, Lio/flutter/view/AccessibilityBridge$Action;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Action;->PASTE:Lio/flutter/view/AccessibilityBridge$Action;

    .line 2099
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Action;

    const-string v1, "DID_GAIN_ACCESSIBILITY_FOCUS"

    const/16 v3, 0xf

    const v4, 0x8000

    invoke-direct {v0, v1, v3, v4}, Lio/flutter/view/AccessibilityBridge$Action;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Action;->DID_GAIN_ACCESSIBILITY_FOCUS:Lio/flutter/view/AccessibilityBridge$Action;

    .line 2100
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Action;

    const-string v1, "DID_LOSE_ACCESSIBILITY_FOCUS"

    const/high16 v3, 0x10000

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/view/AccessibilityBridge$Action;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Action;->DID_LOSE_ACCESSIBILITY_FOCUS:Lio/flutter/view/AccessibilityBridge$Action;

    .line 2101
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Action;

    const-string v1, "CUSTOM_ACTION"

    const/16 v2, 0x11

    const/high16 v3, 0x20000

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/view/AccessibilityBridge$Action;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Action;->CUSTOM_ACTION:Lio/flutter/view/AccessibilityBridge$Action;

    .line 2102
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Action;

    const-string v1, "DISMISS"

    const/16 v2, 0x12

    const/high16 v3, 0x40000

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/view/AccessibilityBridge$Action;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Action;->DISMISS:Lio/flutter/view/AccessibilityBridge$Action;

    .line 2103
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Action;

    const-string v1, "MOVE_CURSOR_FORWARD_BY_WORD"

    const/16 v2, 0x13

    const/high16 v3, 0x80000

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/view/AccessibilityBridge$Action;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Action;->MOVE_CURSOR_FORWARD_BY_WORD:Lio/flutter/view/AccessibilityBridge$Action;

    .line 2104
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Action;

    const-string v1, "MOVE_CURSOR_BACKWARD_BY_WORD"

    const/16 v2, 0x14

    const/high16 v3, 0x100000

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/view/AccessibilityBridge$Action;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Action;->MOVE_CURSOR_BACKWARD_BY_WORD:Lio/flutter/view/AccessibilityBridge$Action;

    .line 2105
    new-instance v0, Lio/flutter/view/AccessibilityBridge$Action;

    const-string v1, "SET_TEXT"

    const/16 v2, 0x15

    const/high16 v3, 0x200000

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/view/AccessibilityBridge$Action;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Action;->SET_TEXT:Lio/flutter/view/AccessibilityBridge$Action;

    .line 2083
    invoke-static {}, Lio/flutter/view/AccessibilityBridge$Action;->$values()[Lio/flutter/view/AccessibilityBridge$Action;

    move-result-object v0

    sput-object v0, Lio/flutter/view/AccessibilityBridge$Action;->$VALUES:[Lio/flutter/view/AccessibilityBridge$Action;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 2109
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2110
    iput p3, p0, Lio/flutter/view/AccessibilityBridge$Action;->value:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/flutter/view/AccessibilityBridge$Action;
    .locals 1

    .line 2083
    const-class v0, Lio/flutter/view/AccessibilityBridge$Action;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/flutter/view/AccessibilityBridge$Action;

    return-object p0
.end method

.method public static values()[Lio/flutter/view/AccessibilityBridge$Action;
    .locals 1

    .line 2083
    sget-object v0, Lio/flutter/view/AccessibilityBridge$Action;->$VALUES:[Lio/flutter/view/AccessibilityBridge$Action;

    invoke-virtual {v0}, [Lio/flutter/view/AccessibilityBridge$Action;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/flutter/view/AccessibilityBridge$Action;

    return-object v0
.end method
