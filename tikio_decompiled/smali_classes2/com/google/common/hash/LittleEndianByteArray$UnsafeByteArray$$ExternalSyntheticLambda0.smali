.class public final synthetic Lcom/google/common/hash/LittleEndianByteArray$UnsafeByteArray$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/security/PrivilegedExceptionAction;


# static fields
.field public static final synthetic INSTANCE:Lcom/google/common/hash/LittleEndianByteArray$UnsafeByteArray$$ExternalSyntheticLambda0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/common/hash/LittleEndianByteArray$UnsafeByteArray$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/google/common/hash/LittleEndianByteArray$UnsafeByteArray$$ExternalSyntheticLambda0;-><init>()V

    sput-object v0, Lcom/google/common/hash/LittleEndianByteArray$UnsafeByteArray$$ExternalSyntheticLambda0;->INSTANCE:Lcom/google/common/hash/LittleEndianByteArray$UnsafeByteArray$$ExternalSyntheticLambda0;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()Ljava/lang/Object;
    .locals 1

    invoke-static {}, Lcom/google/common/hash/LittleEndianByteArray$UnsafeByteArray;->lambda$getUnsafe$0()Lsun/misc/Unsafe;

    move-result-object v0

    return-object v0
.end method
