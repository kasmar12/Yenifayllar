.class public final synthetic Lcom/google/common/io/TempFileCreator$JavaNioCreator$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/common/io/TempFileCreator$JavaNioCreator$PermissionSupplier;


# static fields
.field public static final synthetic INSTANCE:Lcom/google/common/io/TempFileCreator$JavaNioCreator$$ExternalSyntheticLambda2;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/common/io/TempFileCreator$JavaNioCreator$$ExternalSyntheticLambda2;

    invoke-direct {v0}, Lcom/google/common/io/TempFileCreator$JavaNioCreator$$ExternalSyntheticLambda2;-><init>()V

    sput-object v0, Lcom/google/common/io/TempFileCreator$JavaNioCreator$$ExternalSyntheticLambda2;->INSTANCE:Lcom/google/common/io/TempFileCreator$JavaNioCreator$$ExternalSyntheticLambda2;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/nio/file/attribute/FileAttribute;
    .locals 1

    invoke-static {}, Lcom/google/common/io/TempFileCreator$JavaNioCreator;->lambda$static$0()Ljava/nio/file/attribute/FileAttribute;

    move-result-object v0

    return-object v0
.end method
