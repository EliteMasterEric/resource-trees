package com.elitemastereric.resourcetrees.common.worldgen.features;

import net.minecraft.resources.ResourceKey;
import net.minecraft.world.level.levelgen.feature.ConfiguredFeature;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.core.registries.Registries;
import net.minecraft.data.worldgen.features.FeatureUtils;

class TreeFeatures {
    public static final GOLD_TREE:ResourceKey<ConfiguredFeature> = ResourceKey.create(Registries.CONFIGURED_FEATURE, new ResourceLocation(ResourceTreesMod.MOD_ID, "gold_tree"));

    public static function register():Void {
        // FeatureUtils.register(context, OAK, Feature.TREE, TreeFeatures.createOak().build());
    }
}