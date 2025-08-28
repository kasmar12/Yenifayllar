.class public final Lio/flutter/plugins/inapppurchase/Messages$PlatformQueryProduct$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages$PlatformQueryProduct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private productId:Ljava/lang/String;

.field private productType:Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/inapppurchase/Messages$PlatformQueryProduct;
    .locals 2

    .line 186
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformQueryProduct;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformQueryProduct;-><init>()V

    .line 187
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformQueryProduct$Builder;->productId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformQueryProduct;->setProductId(Ljava/lang/String;)V

    .line 188
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformQueryProduct$Builder;->productType:Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformQueryProduct;->setProductType(Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;)V

    return-object v0
.end method

.method public setProductId(Ljava/lang/String;)Lio/flutter/plugins/inapppurchase/Messages$PlatformQueryProduct$Builder;
    .locals 0

    .line 173
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformQueryProduct$Builder;->productId:Ljava/lang/String;

    return-object p0
.end method

.method public setProductType(Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;)Lio/flutter/plugins/inapppurchase/Messages$PlatformQueryProduct$Builder;
    .locals 0

    .line 181
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformQueryProduct$Builder;->productType:Lio/flutter/plugins/inapppurchase/Messages$PlatformProductType;

    return-object p0
.end method
