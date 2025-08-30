.class public final Ldev/fluttercommunity/plus/share/SharePlusPendingIntent;
.super Landroid/content/BroadcastReceiver;
.source "SharePlusPendingIntent.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ldev/fluttercommunity/plus/share/SharePlusPendingIntent$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0000\u0018\u0000 \t2\u00020\u0001:\u0001\tB\u0005\u00a2\u0006\u0002\u0010\u0002J\u0018\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0008H\u0016\u00a8\u0006\n"
    }
    d2 = {
        "Ldev/fluttercommunity/plus/share/SharePlusPendingIntent;",
        "Landroid/content/BroadcastReceiver;",
        "()V",
        "onReceive",
        "",
        "context",
        "Landroid/content/Context;",
        "intent",
        "Landroid/content/Intent;",
        "Companion",
        "share_plus_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Ldev/fluttercommunity/plus/share/SharePlusPendingIntent$Companion;

.field private static result:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ldev/fluttercommunity/plus/share/SharePlusPendingIntent$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ldev/fluttercommunity/plus/share/SharePlusPendingIntent$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Ldev/fluttercommunity/plus/share/SharePlusPendingIntent;->Companion:Ldev/fluttercommunity/plus/share/SharePlusPendingIntent$Companion;

    const-string v0, ""

    .line 18
    sput-object v0, Ldev/fluttercommunity/plus/share/SharePlusPendingIntent;->result:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static final synthetic access$getResult$cp()Ljava/lang/String;
    .locals 1

    .line 13
    sget-object v0, Ldev/fluttercommunity/plus/share/SharePlusPendingIntent;->result:Ljava/lang/String;

    return-object v0
.end method

.method public static final synthetic access$setResult$cp(Ljava/lang/String;)V
    .locals 0

    .line 13
    sput-object p0, Ldev/fluttercommunity/plus/share/SharePlusPendingIntent;->result:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "intent"

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 26
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const-string v0, "android.intent.extra.CHOSEN_COMPONENT"

    const/16 v1, 0x21

    if-lt p1, v1, :cond_0

    .line 28
    const-class p1, Landroid/content/ComponentName;

    invoke-virtual {p2, v0, p1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/ComponentName;

    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/content/ComponentName;

    :goto_0
    if-eqz p1, :cond_1

    .line 36
    invoke-virtual {p1}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "flattenToString(...)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    sput-object p1, Ldev/fluttercommunity/plus/share/SharePlusPendingIntent;->result:Ljava/lang/String;

    :cond_1
    return-void
.end method
