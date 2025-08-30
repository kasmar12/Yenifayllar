.class public Lio/flutter/plugins/pathprovider/PathProviderPlugin;
.super Ljava/lang/Object;
.source "PathProviderPlugin.java"

# interfaces
.implements Lio/flutter/embedding/engine/plugins/FlutterPlugin;
.implements Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;


# static fields
.field static final TAG:Ljava/lang/String; = "PathProviderPlugin"


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getApplicationSupportDirectory()Ljava/lang/String;
    .locals 1

    .line 95
    iget-object v0, p0, Lio/flutter/plugins/pathprovider/PathProviderPlugin;->context:Landroid/content/Context;

    invoke-static {v0}, Lio/flutter/util/PathUtils;->getFilesDir(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getPathProviderApplicationDocumentsDirectory()Ljava/lang/String;
    .locals 1

    .line 99
    iget-object v0, p0, Lio/flutter/plugins/pathprovider/PathProviderPlugin;->context:Landroid/content/Context;

    invoke-static {v0}, Lio/flutter/util/PathUtils;->getDataDirectory(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getPathProviderExternalCacheDirectories()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 111
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 113
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-lt v1, v2, :cond_1

    .line 114
    iget-object v1, p0, Lio/flutter/plugins/pathprovider/PathProviderPlugin;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getExternalCacheDirs()[Ljava/io/File;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, v1, v3

    if-eqz v4, :cond_0

    .line 116
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 120
    :cond_1
    iget-object v1, p0, Lio/flutter/plugins/pathprovider/PathProviderPlugin;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 122
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    return-object v0
.end method

.method private getPathProviderExternalStorageDirectories(Lio/flutter/plugins/pathprovider/Messages$StorageDirectory;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/pathprovider/Messages$StorageDirectory;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 160
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 162
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-lt v1, v2, :cond_1

    .line 163
    iget-object v1, p0, Lio/flutter/plugins/pathprovider/PathProviderPlugin;->context:Landroid/content/Context;

    invoke-direct {p0, p1}, Lio/flutter/plugins/pathprovider/PathProviderPlugin;->getStorageDirectoryString(Lio/flutter/plugins/pathprovider/Messages$StorageDirectory;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/content/Context;->getExternalFilesDirs(Ljava/lang/String;)[Ljava/io/File;

    move-result-object p1

    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v3, p1, v2

    if-eqz v3, :cond_0

    .line 165
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 169
    :cond_1
    iget-object v1, p0, Lio/flutter/plugins/pathprovider/PathProviderPlugin;->context:Landroid/content/Context;

    invoke-direct {p0, p1}, Lio/flutter/plugins/pathprovider/PathProviderPlugin;->getStorageDirectoryString(Lio/flutter/plugins/pathprovider/Messages$StorageDirectory;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 171
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    return-object v0
.end method

.method private getPathProviderStorageDirectory()Ljava/lang/String;
    .locals 2

    .line 103
    iget-object v0, p0, Lio/flutter/plugins/pathprovider/PathProviderPlugin;->context:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_0

    return-object v1

    .line 107
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getPathProviderTemporaryDirectory()Ljava/lang/String;
    .locals 1

    .line 91
    iget-object v0, p0, Lio/flutter/plugins/pathprovider/PathProviderPlugin;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getStorageDirectoryString(Lio/flutter/plugins/pathprovider/Messages$StorageDirectory;)Ljava/lang/String;
    .locals 3

    .line 130
    sget-object v0, Lio/flutter/plugins/pathprovider/PathProviderPlugin$1;->$SwitchMap$io$flutter$plugins$pathprovider$Messages$StorageDirectory:[I

    invoke-virtual {p1}, Lio/flutter/plugins/pathprovider/Messages$StorageDirectory;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 154
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unrecognized directory: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    const-string p1, "documents"

    return-object p1

    :pswitch_1
    const-string p1, "dcim"

    return-object p1

    :pswitch_2
    const-string p1, "downloads"

    return-object p1

    :pswitch_3
    const-string p1, "movies"

    return-object p1

    :pswitch_4
    const-string p1, "pictures"

    return-object p1

    :pswitch_5
    const-string p1, "notifications"

    return-object p1

    :pswitch_6
    const-string p1, "alarms"

    return-object p1

    :pswitch_7
    const-string p1, "ringtones"

    return-object p1

    :pswitch_8
    const-string p1, "podcasts"

    return-object p1

    :pswitch_9
    const-string p1, "music"

    return-object p1

    :pswitch_a
    const/4 p1, 0x0

    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static registerWith(Lio/flutter/plugin/common/PluginRegistry$Registrar;)V
    .locals 2

    .line 40
    new-instance v0, Lio/flutter/plugins/pathprovider/PathProviderPlugin;

    invoke-direct {v0}, Lio/flutter/plugins/pathprovider/PathProviderPlugin;-><init>()V

    .line 41
    invoke-interface {p0}, Lio/flutter/plugin/common/PluginRegistry$Registrar;->messenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v1

    invoke-interface {p0}, Lio/flutter/plugin/common/PluginRegistry$Registrar;->context()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lio/flutter/plugins/pathprovider/PathProviderPlugin;->setup(Lio/flutter/plugin/common/BinaryMessenger;Landroid/content/Context;)V

    return-void
.end method

.method private setup(Lio/flutter/plugin/common/BinaryMessenger;Landroid/content/Context;)V
    .locals 2

    .line 29
    :try_start_0
    invoke-static {p1, p0}, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi$-CC;->setup(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "PathProviderPlugin"

    const-string v1, "Received exception while setting up PathProviderPlugin"

    .line 31
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 34
    :goto_0
    iput-object p2, p0, Lio/flutter/plugins/pathprovider/PathProviderPlugin;->context:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public getApplicationCachePath()Ljava/lang/String;
    .locals 1

    .line 71
    iget-object v0, p0, Lio/flutter/plugins/pathprovider/PathProviderPlugin;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getApplicationDocumentsPath()Ljava/lang/String;
    .locals 1

    .line 66
    invoke-direct {p0}, Lio/flutter/plugins/pathprovider/PathProviderPlugin;->getPathProviderApplicationDocumentsDirectory()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getApplicationSupportPath()Ljava/lang/String;
    .locals 1

    .line 61
    invoke-direct {p0}, Lio/flutter/plugins/pathprovider/PathProviderPlugin;->getApplicationSupportDirectory()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExternalCachePaths()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 81
    invoke-direct {p0}, Lio/flutter/plugins/pathprovider/PathProviderPlugin;->getPathProviderExternalCacheDirectories()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getExternalStoragePath()Ljava/lang/String;
    .locals 1

    .line 76
    invoke-direct {p0}, Lio/flutter/plugins/pathprovider/PathProviderPlugin;->getPathProviderStorageDirectory()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExternalStoragePaths(Lio/flutter/plugins/pathprovider/Messages$StorageDirectory;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/pathprovider/Messages$StorageDirectory;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 87
    invoke-direct {p0, p1}, Lio/flutter/plugins/pathprovider/PathProviderPlugin;->getPathProviderExternalStorageDirectories(Lio/flutter/plugins/pathprovider/Messages$StorageDirectory;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getTemporaryPath()Ljava/lang/String;
    .locals 1

    .line 56
    invoke-direct {p0}, Lio/flutter/plugins/pathprovider/PathProviderPlugin;->getPathProviderTemporaryDirectory()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onAttachedToEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 1

    .line 46
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v0

    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lio/flutter/plugins/pathprovider/PathProviderPlugin;->setup(Lio/flutter/plugin/common/BinaryMessenger;Landroid/content/Context;)V

    return-void
.end method

.method public onDetachedFromEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 1

    .line 51
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi$-CC;->setup(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;)V

    return-void
.end method
