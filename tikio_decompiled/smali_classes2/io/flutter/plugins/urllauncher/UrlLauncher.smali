.class final Lio/flutter/plugins/urllauncher/UrlLauncher;
.super Ljava/lang/Object;
.source "UrlLauncher.java"

# interfaces
.implements Lio/flutter/plugins/urllauncher/Messages$UrlLauncherApi;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/urllauncher/UrlLauncher$IntentResolver;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final TAG:Ljava/lang/String; = "UrlLauncher"


# instance fields
.field private activity:Landroid/app/Activity;

.field private final applicationContext:Landroid/content/Context;

.field private final intentResolver:Lio/flutter/plugins/urllauncher/UrlLauncher$IntentResolver;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 53
    new-instance v0, Lio/flutter/plugins/urllauncher/UrlLauncher$$ExternalSyntheticLambda0;

    invoke-direct {v0, p1}, Lio/flutter/plugins/urllauncher/UrlLauncher$$ExternalSyntheticLambda0;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, p1, v0}, Lio/flutter/plugins/urllauncher/UrlLauncher;-><init>(Landroid/content/Context;Lio/flutter/plugins/urllauncher/UrlLauncher$IntentResolver;)V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lio/flutter/plugins/urllauncher/UrlLauncher$IntentResolver;)V
    .locals 0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lio/flutter/plugins/urllauncher/UrlLauncher;->applicationContext:Landroid/content/Context;

    .line 49
    iput-object p2, p0, Lio/flutter/plugins/urllauncher/UrlLauncher;->intentResolver:Lio/flutter/plugins/urllauncher/UrlLauncher$IntentResolver;

    return-void
.end method

.method private static containsRestrictedHeader(Ljava/util/Map;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 158
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :pswitch_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 159
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    const/4 v2, -0x1

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/4 v4, 0x1

    sparse-switch v3, :sswitch_data_0

    :goto_0
    const/4 v1, -0x1

    goto :goto_1

    :sswitch_0
    const-string v1, "accept-language"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x3

    goto :goto_1

    :sswitch_1
    const-string v1, "content-type"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x2

    goto :goto_1

    :sswitch_2
    const-string v1, "content-language"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x1

    goto :goto_1

    :sswitch_3
    const-string v3, "accept"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_0

    :cond_3
    :goto_1
    packed-switch v1, :pswitch_data_0

    return v4

    :cond_4
    return v1

    :sswitch_data_0
    .sparse-switch
        -0x54d84af8 -> :sswitch_3
        -0x494c25d4 -> :sswitch_2
        0x2ed4600e -> :sswitch_1
        0x2fd98a7d -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private ensureActivity()V
    .locals 4

    .line 182
    iget-object v0, p0, Lio/flutter/plugins/urllauncher/UrlLauncher;->activity:Landroid/app/Activity;

    if-eqz v0, :cond_0

    return-void

    .line 183
    :cond_0
    new-instance v0, Lio/flutter/plugins/urllauncher/Messages$FlutterError;

    const/4 v1, 0x0

    const-string v2, "NO_ACTIVITY"

    const-string v3, "Launching a URL requires a foreground activity."

    invoke-direct {v0, v2, v3, v1}, Lio/flutter/plugins/urllauncher/Messages$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method private static extractBundle(Ljava/util/Map;)Landroid/os/Bundle;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/os/Bundle;"
        }
    .end annotation

    .line 173
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 174
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 175
    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 176
    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method static synthetic lambda$new$0(Landroid/content/Context;Landroid/content/Intent;)Ljava/lang/String;
    .locals 0

    .line 56
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    .line 57
    :cond_0
    invoke-virtual {p0}, Landroid/content/ComponentName;->toShortString()Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method private static openCustomTab(Landroid/content/Context;Landroid/net/Uri;Landroid/os/Bundle;)Z
    .locals 3

    .line 145
    new-instance v0, Landroidx/browser/customtabs/CustomTabsIntent$Builder;

    invoke-direct {v0}, Landroidx/browser/customtabs/CustomTabsIntent$Builder;-><init>()V

    invoke-virtual {v0}, Landroidx/browser/customtabs/CustomTabsIntent$Builder;->build()Landroidx/browser/customtabs/CustomTabsIntent;

    move-result-object v0

    .line 146
    iget-object v1, v0, Landroidx/browser/customtabs/CustomTabsIntent;->intent:Landroid/content/Intent;

    const-string v2, "com.android.browser.headers"

    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 148
    :try_start_0
    invoke-virtual {v0, p0, p1}, Landroidx/browser/customtabs/CustomTabsIntent;->launchUrl(Landroid/content/Context;Landroid/net/Uri;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p0, 0x1

    return p0

    :catch_0
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public canLaunchUrl(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 2

    .line 67
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 68
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 69
    iget-object p1, p0, Lio/flutter/plugins/urllauncher/UrlLauncher;->intentResolver:Lio/flutter/plugins/urllauncher/UrlLauncher$IntentResolver;

    invoke-interface {p1, v0}, Lio/flutter/plugins/urllauncher/UrlLauncher$IntentResolver;->getHandlerComponentName(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 74
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :cond_0
    const-string v0, "{com.android.fallback/com.android.fallback.Fallback}"

    .line 77
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public closeWebView()V
    .locals 3

    .line 135
    iget-object v0, p0, Lio/flutter/plugins/urllauncher/UrlLauncher;->applicationContext:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "close action"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method public launchUrl(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/Boolean;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/Boolean;"
        }
    .end annotation

    .line 83
    invoke-direct {p0}, Lio/flutter/plugins/urllauncher/UrlLauncher;->ensureActivity()V

    .line 86
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 88
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object p1

    .line 89
    invoke-static {p2}, Lio/flutter/plugins/urllauncher/UrlLauncher;->extractBundle(Ljava/util/Map;)Landroid/os/Bundle;

    move-result-object p2

    const-string v0, "com.android.browser.headers"

    invoke-virtual {p1, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object p1

    .line 91
    :try_start_0
    iget-object p2, p0, Lio/flutter/plugins/urllauncher/UrlLauncher;->activity:Landroid/app/Activity;

    invoke-virtual {p2, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    .line 96
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :catch_0
    const/4 p1, 0x0

    .line 93
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public openUrlInApp(Ljava/lang/String;Ljava/lang/Boolean;Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;)Ljava/lang/Boolean;
    .locals 3

    .line 102
    invoke-direct {p0}, Lio/flutter/plugins/urllauncher/UrlLauncher;->ensureActivity()V

    .line 105
    invoke-virtual {p3}, Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;->getHeaders()Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Lio/flutter/plugins/urllauncher/UrlLauncher;->extractBundle(Ljava/util/Map;)Landroid/os/Bundle;

    move-result-object v0

    .line 109
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    const/4 v1, 0x1

    if-eqz p2, :cond_0

    invoke-virtual {p3}, Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;->getHeaders()Ljava/util/Map;

    move-result-object p2

    invoke-static {p2}, Lio/flutter/plugins/urllauncher/UrlLauncher;->containsRestrictedHeader(Ljava/util/Map;)Z

    move-result p2

    if-nez p2, :cond_0

    .line 110
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    .line 111
    iget-object v2, p0, Lio/flutter/plugins/urllauncher/UrlLauncher;->activity:Landroid/app/Activity;

    invoke-static {v2, p2, v0}, Lio/flutter/plugins/urllauncher/UrlLauncher;->openCustomTab(Landroid/content/Context;Landroid/net/Uri;Landroid/os/Bundle;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 112
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    .line 117
    :cond_0
    iget-object p2, p0, Lio/flutter/plugins/urllauncher/UrlLauncher;->activity:Landroid/app/Activity;

    .line 121
    invoke-virtual {p3}, Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;->getEnableJavaScript()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    .line 122
    invoke-virtual {p3}, Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;->getEnableDomStorage()Ljava/lang/Boolean;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    .line 118
    invoke-static {p2, p1, v2, p3, v0}, Lio/flutter/plugins/urllauncher/WebViewActivity;->createIntent(Landroid/content/Context;Ljava/lang/String;ZZLandroid/os/Bundle;)Landroid/content/Intent;

    move-result-object p1

    .line 125
    :try_start_0
    iget-object p2, p0, Lio/flutter/plugins/urllauncher/UrlLauncher;->activity:Landroid/app/Activity;

    invoke-virtual {p2, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :catch_0
    const/4 p1, 0x0

    .line 127
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method setActivity(Landroid/app/Activity;)V
    .locals 0

    .line 62
    iput-object p1, p0, Lio/flutter/plugins/urllauncher/UrlLauncher;->activity:Landroid/app/Activity;

    return-void
.end method

.method public supportsCustomTabs()Ljava/lang/Boolean;
    .locals 2

    .line 140
    iget-object v0, p0, Lio/flutter/plugins/urllauncher/UrlLauncher;->applicationContext:Landroid/content/Context;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/browser/customtabs/CustomTabsClient;->getPackageName(Landroid/content/Context;Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
