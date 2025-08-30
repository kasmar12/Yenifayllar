.class final Ldev/fluttercommunity/plus/share/Share$immutabilityIntentFlags$2;
.super Lkotlin/jvm/internal/Lambda;
.source "Share.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ldev/fluttercommunity/plus/share/Share;-><init>(Landroid/content/Context;Landroid/app/Activity;Ldev/fluttercommunity/plus/share/ShareSuccessManager;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0004\u0008\u0002\u0010\u0003"
    }
    d2 = {
        "<anonymous>",
        "",
        "invoke",
        "()Ljava/lang/Integer;"
    }
    k = 0x3
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Ldev/fluttercommunity/plus/share/Share$immutabilityIntentFlags$2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ldev/fluttercommunity/plus/share/Share$immutabilityIntentFlags$2;

    invoke-direct {v0}, Ldev/fluttercommunity/plus/share/Share$immutabilityIntentFlags$2;-><init>()V

    sput-object v0, Ldev/fluttercommunity/plus/share/Share$immutabilityIntentFlags$2;->INSTANCE:Ldev/fluttercommunity/plus/share/Share$immutabilityIntentFlags$2;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Integer;
    .locals 2

    .line 35
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    const/high16 v0, 0x2000000

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 38
    :goto_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 34
    invoke-virtual {p0}, Ldev/fluttercommunity/plus/share/Share$immutabilityIntentFlags$2;->invoke()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
