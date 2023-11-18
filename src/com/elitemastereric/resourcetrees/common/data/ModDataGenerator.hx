package com.elitemastereric.resourcetrees.common.data;

import net.fabricmc.fabric.api.datagen.v1.DataGeneratorEntrypoint;
import net.fabricmc.fabric.api.datagen.v1.FabricDataGenerator;
import net.minecraft.registry.RegistryBuilder;

class ModDataGenerator implements DataGeneratorEntrypoint {
	public function onInitializeDataGenerator(fabricDataGenerator:FabricDataGenerator) {
		var pack:FabricDataGenerator.Pack = fabricDataGenerator.createPack();

		pack.addProvider(ModWorldGen::new);
	}

	public function buildRegistry(registryBuilder:RegistryBuilder ) {
		registryBuilder.addRegistry(RegistryKeys.CONFIGURED_FEATURE, ModConfiguredFeatures::bootstrap);
		registryBuilder.addRegistry(RegistryKeys.PLACED_FEATURE, ModPlacedFeatures::bootstrap);
	}
}