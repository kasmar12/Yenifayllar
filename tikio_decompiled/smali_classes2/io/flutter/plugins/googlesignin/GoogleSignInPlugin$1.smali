.class synthetic Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$1;
.super Ljava/lang/Object;
.source "GoogleSignInPlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/googlesignin/GoogleSignInPlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$io$flutter$plugins$googlesignin$Messages$SignInType:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 439
    invoke-static {}, Lio/flutter/plugins/googlesignin/Messages$SignInType;->values()[Lio/flutter/plugins/googlesignin/Messages$SignInType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$1;->$SwitchMap$io$flutter$plugins$googlesignin$Messages$SignInType:[I

    :try_start_0
    sget-object v1, Lio/flutter/plugins/googlesignin/Messages$SignInType;->GAMES:Lio/flutter/plugins/googlesignin/Messages$SignInType;

    invoke-virtual {v1}, Lio/flutter/plugins/googlesignin/Messages$SignInType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lio/flutter/plugins/googlesignin/GoogleSignInPlugin$1;->$SwitchMap$io$flutter$plugins$googlesignin$Messages$SignInType:[I

    sget-object v1, Lio/flutter/plugins/googlesignin/Messages$SignInType;->STANDARD:Lio/flutter/plugins/googlesignin/Messages$SignInType;

    invoke-virtual {v1}, Lio/flutter/plugins/googlesignin/Messages$SignInType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    return-void
.end method
