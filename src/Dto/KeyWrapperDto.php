<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\KeyWrappers\Dto;

/**
 * Simple immutable DTO with public readonly properties.
 * - No logic; just a data carrier.
 * - Strong types enforce the contract across layers.
 */
final class KeyWrapperDto implements \JsonSerializable {
    public function __construct(
        public readonly int $id,
        public readonly string $wrapperUuid,
        public readonly int $kms1KeyId,
        public readonly int $kms2KeyId,
        public readonly string $dekWrap1,
        public readonly string $dekWrap2,
        public readonly array|null $cryptoSuite,
        public readonly int $wrapVersion,
        public readonly string $status,
        public readonly \DateTimeImmutable $createdAt,
        public readonly ?\DateTimeImmutable $rotatedAt
    ) {}

    /** Suitable for serialization/logging (without large blobs). */
    public function toArray(): array {
        return get_object_vars($this);
    }

    /** toArray() without null values - for clean logging/diffs. */
    public function toArrayNonNull(): array {
        return array_filter(get_object_vars($this), static fn($v) => $v !== null);
    }

    public function jsonSerialize(): array {
       $a = $this->toArray();
       foreach ($a as $k => $v) {
           if ($v instanceof \DateTimeInterface) {
               // ISO-8601 with a timezone; switch to 'Y-m-d H:i:s.u' if needed
               $a[$k] = $v->format(\DateTimeInterface::ATOM);
           }
       }
       return $a;
   }
}
