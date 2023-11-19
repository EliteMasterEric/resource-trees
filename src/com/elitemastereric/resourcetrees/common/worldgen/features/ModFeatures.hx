package com.elitemastereric.resourcetrees.common.worldgen.features;

import com.elitemastereric.resourcetrees.ResourceTreesMod;

import net.minecraft.core.registries.Registries;
import net.minecraft.resources.ResourceKey;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.world.level.levelgen.feature.Feature;
import net.minecraft.world.level.levelgen.feature.ConfiguredFeature;
import net.minecraft.world.level.levelgen.placement.PlacedFeature;
import net.minecraft.world.level.levelgen.feature.configurations.TreeConfiguration;
import net.minecraft.world.level.levelgen.feature.configurations.TreeConfiguration.TreeConfiguration_TreeConfigurationBuilder;

class ModPlacedFeatures {
    // Configured features are features with a certain configuration.

    public static final GOLD_TREE_CONFIGURED:ResourceKey<ConfiguredFeature> = configuredFeatureKey("gold_tree");

    public static final GOLD_TREE_PLACED:ResourceKey<PlacedFeature> = placedFeatureKey("gold_tree");

    public static function bootstrapConfigured(context:net.minecraft.data.worldgen.BootstapContext<ConfiguredFeature>) {
        context.register(GOLD_TREE_CONFIGURED, new ConfiguredFeature(Feature.TREE, new TreeConfiguration_TreeConfigurationBuilder(
            //Block
        ).build()));
    }

    private static inline function configuredFeatureKey(id:String):ResourceKey<ConfiguredFeature> {
        return ResourceKey.create(Registries.CONFIGURED_FEATURE, new ResourceLocation(ResourceTreesMod.MOD_ID, id));
    }

    private static inline function placedFeatureKey(id:String):ResourceKey<PlacedFeature> {
        return ResourceKey.create(Registries.PLACED_FEATURE, new ResourceLocation(ResourceTreesMod.MOD_ID, id));
    }
}