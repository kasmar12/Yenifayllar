.class public final enum Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;
.super Ljava/lang/Enum;
.source "FlutterImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/android/FlutterImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SurfaceKind"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;

.field public static final enum background:Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;

.field public static final enum overlay:Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;


# direct methods
.method private static synthetic $values()[Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;

    .line 56
    sget-object v1, Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;->background:Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;->overlay:Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 58
    new-instance v0, Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;

    const-string v1, "background"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;->background:Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;

    .line 61
    new-instance v0, Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;

    const-string v1, "overlay"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;->overlay:Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;

    .line 56
    invoke-static {}, Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;->$values()[Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;

    move-result-object v0

    sput-object v0, Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;->$VALUES:[Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 56
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;
    .locals 1

    .line 56
    const-class v0, Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;

    return-object p0
.end method

.method public static values()[Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;
    .locals 1

    .line 56
    sget-object v0, Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;->$VALUES:[Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;

    invoke-virtual {v0}, [Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/flutter/embedding/android/FlutterImageView$SurfaceKind;

    return-object v0
.end method
