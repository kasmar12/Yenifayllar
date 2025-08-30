.class public final Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private obfuscatedAccountId:Ljava/lang/String;

.field private obfuscatedProfileId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 237
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;
    .locals 2

    .line 256
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;-><init>()V

    .line 257
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers$Builder;->obfuscatedAccountId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;->setObfuscatedAccountId(Ljava/lang/String;)V

    .line 258
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers$Builder;->obfuscatedProfileId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;->setObfuscatedProfileId(Ljava/lang/String;)V

    return-object v0
.end method

.method public setObfuscatedAccountId(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers$Builder;
    .locals 0

    .line 243
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers$Builder;->obfuscatedAccountId:Ljava/lang/String;

    return-object p0
.end method

.method public setObfuscatedProfileId(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers$Builder;
    .locals 0

    .line 251
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers$Builder;->obfuscatedProfileId:Ljava/lang/String;

    return-object p0
.end method
