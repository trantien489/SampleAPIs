﻿using Microsoft.Extensions.Options;
using OA.Core.Configurations;
using OA.Core.Constants;
using OA.Core.Factories;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Security.Principal;
using System.Threading.Tasks;
namespace OA.Service.Factories
{
    public class JwtFactory : IJwtFactory
    {
        private readonly JwtIssuerOptions _jwtOptions;
        public JwtFactory(IOptions<JwtIssuerOptions> jwtOptions)
        {
            _jwtOptions = jwtOptions.Value;
            ThrowIfInvalidOptions(_jwtOptions);
        }
        public async Task<string> GenerateEncodedToken(string userName, ClaimsIdentity identity)
        {
            var claims = new List<Claim>
            {
                 new Claim(JwtRegisteredClaimNames.Sub, userName),
                 new Claim(JwtRegisteredClaimNames.Jti, await _jwtOptions.JtiGenerator()),
                 new Claim(JwtRegisteredClaimNames.Iat, ToUnixEpochDate(_jwtOptions.IssuedAt).ToString(), ClaimValueTypes.Integer64),
                 identity.FindFirst(ConstantsJWT.Strings.JwtClaimIdentifiers.Rol),
                 identity.FindFirst(ConstantsJWT.Strings.JwtClaimIdentifiers.Id)
            };
            if (identity.Claims != null)
            {
                identity.Claims.ToList().ForEach(x =>
                {
                    claims.Add(x);
                });
            }
            // Create the JWT security token and encode it.
            var jwt = new JwtSecurityToken(
                issuer: _jwtOptions.Issuer,
                audience: _jwtOptions.Audience,
                claims: claims,
                notBefore: _jwtOptions.NotBefore,
                expires: _jwtOptions.Expiration,
                signingCredentials: _jwtOptions.SigningCredentials);
            var encodedJwt = new JwtSecurityTokenHandler().WriteToken(jwt);
            return encodedJwt;
        }
        public ClaimsIdentity GenerateClaimsIdentity(string userName, string id, List<string> roles = null)
        {
            var claims = new List<Claim>
            {
                new Claim(ConstantsJWT.Strings.JwtClaimIdentifiers.Id, id),
                new Claim(ConstantsJWT.Strings.JwtClaimIdentifiers.Rol, ConstantsJWT.Strings.JwtClaims.ApiAccess) //verify by policy
            };
            //verify by roles from db
            if (roles != null)
            {
                var claimRoles = new List<Claim>();
                roles.ForEach(x =>
                {
                    claimRoles.Add(new Claim(ClaimTypes.Role, x));
                });
                claims.AddRange(claimRoles);
            }
            return new ClaimsIdentity(new GenericIdentity(userName, "Token"), claims);
            //return new ClaimsIdentity(new GenericIdentity(userName, "Token"), new[]
            //{
            //    new Claim(ConstantsJWT.Strings.JwtClaimIdentifiers.Id, id),
            //    new Claim(ConstantsJWT.Strings.JwtClaimIdentifiers.Rol, ConstantsJWT.Strings.JwtClaims.ApiAccess),
            //    new Claim(ClaimTypes.Role, "Administrator") // ClaimType.Role add role for authorization.
            //});
        }
        /// <returns>Date converted to seconds since Unix epoch (Jan 1, 1970, midnight UTC).</returns>
        private static long ToUnixEpochDate(DateTime date)
          => (long)Math.Round((date.ToUniversalTime() -
                               new DateTimeOffset(1970, 1, 1, 0, 0, 0, TimeSpan.Zero))
                              .TotalSeconds);
        private static void ThrowIfInvalidOptions(JwtIssuerOptions options)
        {
            if (options == null) throw new ArgumentNullException(nameof(options));
            if (options.ValidFor <= TimeSpan.Zero)
            {
                throw new ArgumentException("Must be a non-zero TimeSpan.", nameof(JwtIssuerOptions.ValidFor));
            }
            if (options.SigningCredentials == null)
            {
                throw new ArgumentNullException(nameof(JwtIssuerOptions.SigningCredentials));
            }
            if (options.JtiGenerator == null)
            {
                throw new ArgumentNullException(nameof(JwtIssuerOptions.JtiGenerator));
            }
        }
    }
}
