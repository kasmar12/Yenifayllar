.class Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApiCodec;
.super Lio/flutter/plugin/common/StandardMessageCodec;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/googlesignin/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "GoogleSignInApiCodec"
.end annotation


# static fields
.field public static final INSTANCE:Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApiCodec;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 409
    new-instance v0, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApiCodec;

    invoke-direct {v0}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApiCodec;-><init>()V

    sput-object v0, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApiCodec;->INSTANCE:Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApiCodec;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 411
    invoke-direct {p0}, Lio/flutter/plugin/common/StandardMessageCodec;-><init>()V

    return-void
.end method


# virtual methods
.method protected readValueOfType(BLjava/nio/ByteBuffer;)Ljava/lang/Object;
    .locals 1

    const/16 v0, -0x80

    if-eq p1, v0, :cond_1

    const/16 v0, -0x7f

    if-eq p1, v0, :cond_0

    .line 421
    invoke-super {p0, p1, p2}, Lio/flutter/plugin/common/StandardMessageCodec;->readValueOfType(BLjava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 419
    :cond_0
    invoke-virtual {p0, p2}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Lio/flutter/plugins/googlesignin/Messages$UserData;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/googlesignin/Messages$UserData;

    move-result-object p1

    return-object p1

    .line 417
    :cond_1
    invoke-virtual {p0, p2}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Lio/flutter/plugins/googlesignin/Messages$InitParams;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/googlesignin/Messages$InitParams;

    move-result-object p1

    return-object p1
.end method

.method protected writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V
    .locals 1

    .line 427
    instance-of v0, p2, Lio/flutter/plugins/googlesignin/Messages$InitParams;

    if-eqz v0, :cond_0

    const/16 v0, 0x80

    .line 428
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 429
    check-cast p2, Lio/flutter/plugins/googlesignin/Messages$InitParams;

    invoke-virtual {p2}, Lio/flutter/plugins/googlesignin/Messages$InitParams;->toList()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto :goto_0

    .line 430
    :cond_0
    instance-of v0, p2, Lio/flutter/plugins/googlesignin/Messages$UserData;

    if-eqz v0, :cond_1

    const/16 v0, 0x81

    .line 431
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 432
    check-cast p2, Lio/flutter/plugins/googlesignin/Messages$UserData;

    invoke-virtual {p2}, Lio/flutter/plugins/googlesignin/Messages$UserData;->toList()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/googlesignin/Messages$GoogleSignInApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto :goto_0

    .line 434
    :cond_1
    invoke-super {p0, p1, p2}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method
